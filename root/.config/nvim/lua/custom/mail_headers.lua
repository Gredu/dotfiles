-- Highlight the header block that aerc writes at the top of the pager
-- ([viewer] show-headers=true + the .headers filter), so headers stand apart
-- from the body: a darker band, per-header colours and a separator line.
-- Colours come from the hybrid colorscheme palette.

local M = {}

local ns = vim.api.nvim_create_namespace "mail_headers"

local address_headers = { from = true, to = true, cc = true, bcc = true, ["reply-to"] = true }

local function palette()
  local ok, colors = pcall(require, "hybrid.colors")
  if ok and colors.palette then
    return colors.palette
  end
  -- hybrid's values, in case the plugin is not loaded
  return {
    dull_black = "#151718", white = "#c5c8c6", bright_white = "#eaeaea", dull_white = "#707880",
    blue = "#81a2be", green = "#b5bd68", cyan = "#8abeb7", yellow = "#f0c674", magenta = "#b294bb",
  }
end

local function define_highlights()
  local p = palette()
  local set = vim.api.nvim_set_hl
  set(0, "MailHeaderBlock", { bg = p.dull_black })
  set(0, "MailHeaderKey", { fg = p.blue, bold = true })
  set(0, "MailHeaderFrom", { fg = p.green, bold = true })
  set(0, "MailHeaderAddress", { fg = p.cyan })
  set(0, "MailHeaderEmail", { fg = p.dull_white })
  set(0, "MailHeaderSubject", { fg = p.yellow, bold = true })
  set(0, "MailHeaderDate", { fg = p.dull_white })
  set(0, "MailHeaderLabels", { fg = p.magenta, italic = true })
  set(0, "MailHeaderSeparator", { fg = p.dull_white })
end

local value_group = {
  from = "MailHeaderFrom",
  subject = "MailHeaderSubject",
  date = "MailHeaderDate",
  labels = "MailHeaderLabels",
}

local function mark(buf, row, s, e, group)
  vim.api.nvim_buf_set_extmark(buf, ns, row, s, { end_col = e, hl_group = group, priority = 200 })
end

-- Number of header lines at the top of the buffer (0 if it has none).
function M.header_count(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if not (lines[1] and lines[1]:match "^[%w-]+: ") then
    return 0
  end
  for i, l in ipairs(lines) do
    if l == "" then
      return i - 1
    end
  end
  return #lines
end

function M.highlight(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  local n = M.header_count(buf)
  if n == 0 then
    return
  end
  define_highlights()
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local key
  for row, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, n, false)) do
    row = row - 1
    vim.api.nvim_buf_set_extmark(buf, ns, row, 0, { line_hl_group = "MailHeaderBlock", priority = 100 })

    local value_start = 0
    local k, colon = line:match "^([%w-]+)():"
    if k then
      key = k:lower()
      mark(buf, row, 0, colon, "MailHeaderKey")
      value_start = colon
    end

    if key then
      local group = value_group[key] or (address_headers[key] and "MailHeaderAddress")
      if group then
        mark(buf, row, value_start, #line, group)
      end
      -- Dim the <address> part so the names are what stands out.
      if address_headers[key] then
        local pos = value_start + 1
        while true do
          local s, e = line:find("<[^>]*>", pos)
          if not s then break end
          mark(buf, row, s - 1, e, "MailHeaderEmail")
          pos = e + 1
        end
      end
    end
  end

  -- Draw the blank line after the headers as a separator.
  if n < vim.api.nvim_buf_line_count(buf) then
    vim.api.nvim_buf_set_extmark(buf, ns, n, 0, {
      virt_text = { { string.rep("─", vim.o.columns), "MailHeaderSeparator" } },
      virt_text_pos = "overlay",
      priority = 200,
    })
  end
end

return M
