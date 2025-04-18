-- Maps
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

-- General
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>', opts)  -- quick reload sources

-- Window resizing
map('n', '<down>',  ':resize -1<CR>',           opts)
map('n', '<up>',    ':resize +1<CR>',           opts)
map('n', '<left>',  ':vertical resize -1<CR>',  opts)
map('n', '<rigth>', ':vertical resize +11<CR>', opts)

-- Telescope
map('n', '<c-n>',      ':Telescope buffers<CR>',      opts)
map('n', 'L',          ':Telescope buffers<CR>',      opts)
map('n', '<leader>ff', ':Telescope find_files<CR>',   opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>',    opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>',    opts)
map('n', '<leader>fk', ':Telescope keymaps<CR>',      opts)
map('n', '<leader>fn', ':Telescope file_browser<CR>', opts)
map('n', '<leader>fr', ':Telescope registers<CR>',    opts)
map('n', '<leader>fs', ':Telescope git_status<CR>',   opts)

-- Gitsigns
map('n', '<leader>gv', ':Gitsigns preview_hunk<CR>', opts)
map('n', 'gj',         ':Gitsigns next_hunk<CR>',    opts)
map('n', 'gk',         ':Gitsigns prev_hunk<CR>',    opts)
map('n', '<leader>ga', ':Gitsigns stage_hunk<CR>',   opts)
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>',   opts)
map('n', '<leader>gw', ':Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>gb', ':Gitsigns blame_line<CR>',   opts)

-- LSP
map('n', 'gD',        ':lua vim.lsp.buf.declaration()<CR>',                                opts)
map('n', 'gd',        ':lua vim.lsp.buf.definition()<CR>',                                 opts)
map('n', 'ga',        ':lua vim.lsp.buf.code_action()<CR>',                                opts)
map('n', 'K',         ':lua vim.lsp.buf.hover()<CR>',                                      opts)
map('n', 'gi',        ':lua vim.lsp.buf.implementation()<CR>',                             opts)
-- map('n', '<C-k>',     ':lua vim.lsp.buf.signature_help()<CR>',                             opts)
map('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>',                       opts)
map('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>',                    opts)
map('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D',  ':lua vim.lsp.buf.type_definition()<CR>',                            opts)
map('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>',                                     opts)
map('n', 'gr',        ':lua vim.lsp.buf.references()<CR>',                                 opts)
map('n', '<space>e',  ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',               opts)
map('n', 'gJ',        ':lua vim.diagnostic.goto_next()<CR>',                               opts)
map('n', 'gK',        ':lua vim.diagnostic.goto_prev()<CR>',                               opts)
map('n', '<space>q',  ':lua vim.lsp.diagnostic.set_loclist()<CR>',                         opts)

vim.g.user_emmet_leader_key = '<C-e>'
