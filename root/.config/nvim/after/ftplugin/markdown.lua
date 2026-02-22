local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
vim.opt.wrap = true
vim.opt.linebreak = true
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
require('cmp').setup.buffer { enabled = false }
