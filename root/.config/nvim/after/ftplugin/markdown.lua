local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
vim.opt.wrap = true
vim.opt.linebreak = true
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
require('cmp').setup.buffer { enabled = false }

-- gx: also follow reference links ([text][ref], [ref][], [ref]) to their
-- "[ref]: url" definition; otherwise defer to Neovim's global gx.
local function open_link()
  local line, col = vim.api.nvim_get_current_line(), vim.fn.col('.')
  local pos = 1
  while true do
    local s, e, text = line:find('%[([^%]]*)%]', pos)
    if not s then break end
    local ref, nxt = text, line:sub(e + 1, e + 1)
    if nxt == '[' then
      local e2, r = select(2, line:find('^%[([^%]]*)%]', e + 1))
      if e2 then e, ref = e2, (r ~= '' and r or text) end
    end
    if nxt ~= '(' and col >= s and col <= e then
      ref = ref:lower()
      for _, l in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        local k, url = l:match('^%s*%[([^%]]+)%]:%s*<?([^%s>]+)')
        if k and k:lower() == ref then return vim.ui.open(url) end
      end
      if nxt == '[' then
        return vim.notify('No definition for [' .. ref .. ']', vim.log.levels.WARN)
      end
    end
    pos = e + 1
  end
  for _, m in ipairs(vim.api.nvim_get_keymap('n')) do
    if m.lhs == 'gx' and m.callback then return m.callback() end
  end
end
vim.keymap.set('n', 'gx', open_link, { buffer = true, desc = 'Open link under cursor (incl. markdown reference links)' })
