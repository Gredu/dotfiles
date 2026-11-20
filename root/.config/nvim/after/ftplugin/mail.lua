local signatures = {
  SaaShop = {
    fi = {
      greeting = "Hei,",
      sig = {
        "Greatman Lim,",
        "R&D Tiimin vetäjä",
        "SaaShop Oy",
        "+358445200985",
      },
    },
    en = {
      greeting = "Hi,",
      sig = {
        "Greatman Lim,",
        "R&D Team Lead",
        "SaaShop Oy",
        "+358445200985",
      },
    },
  },
  Comets = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
  Gmail = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
  Mahti = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
}

-- With aerc edit-headers=true the buffer starts with a header block that ends
-- at the first blank line. Returns the number of header lines (incl. the blank
-- separator), or 0 when the buffer has no header block.
local function header_end()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  if not (lines[1] and lines[1]:match("^[%w-]+:")) then
    return 0
  end
  for i, l in ipairs(lines) do
    if l == "" then
      return i
    end
  end
  return #lines
end

-- aerc writes address headers one address per line (folded with a leading
-- tab). Join those continuation lines so each header is a single line again.
local function join_address_headers()
  local n = header_end()
  if n == 0 then
    return
  end
  local address_headers = { from = true, to = true, cc = true, bcc = true, ["reply-to"] = true }
  local old = vim.api.nvim_buf_get_lines(0, 0, n, false)
  local new, current = {}, nil
  for _, l in ipairs(old) do
    local key = l:match("^([%w-]+):")
    if key then
      current = key:lower()
      new[#new + 1] = l
    elseif l:match("^%s") and current and address_headers[current] then
      new[#new] = new[#new] .. " " .. vim.trim(l)
    else
      new[#new + 1] = l
    end
  end
  if #new ~= #old then
    vim.api.nvim_buf_set_lines(0, 0, n, false, new)
    vim.bo.modified = false
  end
end

join_address_headers()

-- Long single-line headers soft-wrap instead of running off screen (wrap is
-- off globally). The body is hard-wrapped at textwidth, so it is unaffected.
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "shift:4"

-- The mail ftplugin auto-wraps at textwidth ('t' in formatoptions). Inside the
-- header block that would insert an unindented line break and corrupt the
-- header, so disable auto-wrap while the cursor is there.
local group = vim.api.nvim_create_augroup("MailHeaderFormat" .. vim.api.nvim_get_current_buf(), { clear = true })
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertEnter" }, {
  group = group,
  buffer = 0,
  callback = function()
    if vim.fn.line(".") <= header_end() then
      vim.opt_local.formatoptions:remove("t")
    else
      vim.opt_local.formatoptions:append("t")
    end
  end,
})

local function insert_template(lang)
  local account = vim.env.AERC_ACCOUNT or "Gmail"
  local data = signatures[account] or signatures.Gmail
  local tmpl = data[lang]

  local lines = { tmpl.greeting, "", "", "" }
  for _, line in ipairs(tmpl.sig) do
    lines[#lines + 1] = line
  end

  -- Keep the aerc header block (edit-headers=true), replace only the body.
  local start = header_end()
  vim.api.nvim_buf_set_lines(0, start, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, { start + 2, 0 })
  vim.cmd("startinsert")
end

vim.keymap.set("n", "sfi", function() insert_template("fi") end, { buffer = true })
vim.keymap.set("n", "sen", function() insert_template("en") end, { buffer = true })
