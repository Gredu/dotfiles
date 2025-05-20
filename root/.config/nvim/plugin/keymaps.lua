-- Maps
local opts = { noremap=true, silent=true }

-- Window resizing
vim.keymap.set('n', '<down>',  ':resize -1<CR>',           opts)
vim.keymap.set('n', '<up>',    ':resize +1<CR>',           opts)
vim.keymap.set('n', '<left>',  ':vertical resize -11<CR>', opts)
vim.keymap.set('n', '<right>', ':vertical resize +11<CR>', opts)

-- Telescope
vim.keymap.set('n', 'L',          ':Telescope buffers<CR>',      opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>',   opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>',    opts)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>',    opts)
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>',      opts)
vim.keymap.set('n', '<leader>fr', ':Telescope registers<CR>',    opts)
vim.keymap.set('n', '<leader>fs', ':Telescope git_status<CR>',   opts)

-- Gitsigns
vim.keymap.set('n', '<leader>gv', ':Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', 'gj',         ':Gitsigns next_hunk<CR>',    opts)
vim.keymap.set('n', 'gk',         ':Gitsigns prev_hunk<CR>',    opts)
vim.keymap.set('n', '<leader>ga', ':Gitsigns stage_hunk<CR>',   opts)
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>',   opts)
vim.keymap.set('n', '<leader>gw', ':Gitsigns stage_buffer<CR>', opts)
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>',   opts)

-- LSP
vim.keymap.set('n', 'gD',         ':lua vim.lsp.buf.declaration()<CR>',                                 opts)
vim.keymap.set('n', 'gd',         ':lua vim.lsp.buf.definition()<CR>',                                  opts)
vim.keymap.set('n', 'K',          ':lua vim.lsp.buf.hover()<CR>',                                       opts)
vim.keymap.set('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>',                        opts)
vim.keymap.set('n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>',                     opts)
vim.keymap.set('n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',  opts)
vim.keymap.set('n', '<leader>D',  ':lua vim.lsp.buf.type_definition()<CR>',                             opts)
vim.keymap.set('n', '<leader>e',  ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',                opts)
vim.keymap.set('n', 'gJ',         ':lua vim.diagnostic.goto_next()<CR>',                                opts)
vim.keymap.set('n', 'gK',         ':lua vim.diagnostic.goto_prev()<CR>',                                opts)
vim.keymap.set('n', '<leader>q',  ':lua vim.lsp.diagnostic.set_loclist()<CR>',                          opts)

-- Emmet
vim.g.user_emmet_leader_key = '<C-e>'

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)
