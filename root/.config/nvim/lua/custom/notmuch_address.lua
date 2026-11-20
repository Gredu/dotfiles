-- nvim-cmp source: complete email addresses from notmuch in the address
-- headers (From/To/Cc/Bcc/Reply-To) of mail buffers, as written by aerc with
-- edit-headers=true.
--
-- Querying notmuch per keystroke is too slow once recipients are included
-- (they are not indexed, so notmuch has to read every message). Instead, the
-- full list is dumped to a cache file, refreshed in the background once a
-- day, and filtered in Lua. Until the first dump exists, senders only (which
-- are indexed and fast) are used.

local M = {}

local cache_file = vim.fn.stdpath "cache" .. "/notmuch-addresses"
local max_age = 24 * 60 * 60
local max_items = 100

local address_headers = { from = true, to = true, cc = true, bcc = true, ["reply-to"] = true }

local entries -- { { addr = "Name <a@b>", lower = "name <a@b>", count = n }, ... }
local refreshing = false

local function parse(lines)
  local list = {}
  for _, line in ipairs(lines) do
    local count, addr = line:match "^(%d+)\t(.+)$"
    if addr then
      list[#list + 1] = { addr = addr, lower = addr:lower(), count = tonumber(count) }
    end
  end
  table.sort(list, function(a, b) return a.count > b.count end)
  return list
end

local function refresh_cache()
  if refreshing or vim.fn.executable "notmuch" == 0 then
    return
  end
  refreshing = true
  local tmp = cache_file .. ".tmp"
  vim.fn.mkdir(vim.fn.fnamemodify(cache_file, ":h"), "p")
  -- Detached so it finishes even when aerc's nvim exits first.
  vim.system({
    "sh", "-c",
    'notmuch address --output=count --output=sender --output=recipients --deduplicate=address "*" > "$1" && mv "$1" "$2"',
    "sh", tmp, cache_file,
  }, { detach = true }, function()
    refreshing = false
    entries = nil -- reload from the fresh cache on next completion
  end)
end

local function load()
  if entries then
    return entries
  end
  local stat = vim.uv.fs_stat(cache_file)
  if not stat or os.time() - stat.mtime.sec > max_age then
    refresh_cache()
  end
  if stat then
    entries = parse(vim.fn.readfile(cache_file))
  elseif vim.fn.executable "notmuch" == 1 then
    local out = vim.system({ "notmuch", "address", "--output=count", "--output=sender", "--deduplicate=address", "*" },
      { text = true }):wait()
    -- Not cached in `entries`, so the full list is picked up once it exists.
    return parse(vim.split(out.stdout or "", "\n"))
  else
    return {}
  end
  return entries
end

-- True when the cursor line is inside the header block and belongs to an
-- address header (directly, or as a folded continuation line).
local function in_address_header(bufnr, row)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, row, false)
  if not (lines[1] and lines[1]:match "^[%w-]+:") then
    return false
  end
  for i = 1, row do
    if lines[i] == "" then
      return false -- cursor is in the body
    end
  end
  for i = row, 1, -1 do
    local key = lines[i]:match "^([%w-]+):"
    if key then
      return address_headers[key:lower()] == true
    end
    if not lines[i]:match "^%s" then
      return false
    end
  end
  return false
end

local source = {}

function source:is_available()
  return vim.bo.filetype == "mail"
end

function source:get_debug_name()
  return "notmuch_address"
end

-- Anything up to the previous separator, so both names and addresses match.
function source:get_keyword_pattern()
  return [[\%([^[:space:],:<>"]\)\+]]
end

function source:complete(params, callback)
  local ctx = params.context
  if not in_address_header(ctx.bufnr, ctx.cursor.row) then
    return callback { items = {}, isIncomplete = false }
  end
  -- Only complete after the "Header:" part.
  local colon = ctx.cursor_before_line:find ":"
  if colon and params.offset <= colon then
    return callback { items = {}, isIncomplete = false }
  end

  local input = ctx.cursor_before_line:sub(params.offset):lower()
  local items = {}
  for _, e in ipairs(load()) do
    if e.lower:find(input, 1, true) then
      items[#items + 1] = {
        label = e.addr,
        filterText = e.addr,
        sortText = string.format("%08d", #items),
        kind = require("cmp").lsp.CompletionItemKind.Text,
      }
      if #items >= max_items then
        break
      end
    end
  end
  -- Incomplete: the list is cut at max_items, so re-query as input narrows.
  callback { items = items, isIncomplete = true }
end

function M.register()
  require("cmp").register_source("notmuch_address", source)
end

return M
