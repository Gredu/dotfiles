local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
vim.opt.wrap = 'lbr'
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
