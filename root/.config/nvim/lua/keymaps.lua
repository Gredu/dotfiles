-- Maps

local map = vim.api.nvim_set_keymap

-- General
map('n', ',', ':', {noremap = true})  -- faster command mode enter
map('n', 'H', 'J', {noremap = true})  -- J is reserved for barbar
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>', {noremap = true})  -- quick reload sources
map('n', '<c-p>', ':b#<CR>', {noremap = true})  -- select previous buffer
map('n', 'Y', 'y$', {noremap = true})  -- select previous buffer

-- Window resizing
map('n', '<down>', ':resize -1<CR>', {noremap = true})
map('n', '<up>', ':resize +1<CR>', {noremap = true})
map('n', '<left>', ':vertical resize -1<CR>', {noremap = true})
map('n', '<rigth>', ':vertical resize +11<CR>', {noremap = true})

-- Telescope
map('n', '<c-n>', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fn', ':Telescope file_browser<CR>', {noremap = true})
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true})
map('n', '<leader>fr', ':Telescope registers<CR>', {noremap = true})
map('n', '<leader>fs', ':Telescope git_status<CR>', {noremap = true})

-- Gitsigns
map('n', '<leader>gv', ':Gitsigns preview_hunk<CR>', {noremap = true})
map('n', '<leader>gn', ':Gitsigns next_hunk<CR>', {noremap = true})
map('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', {noremap = true})
map('n', '<leader>ga', ':Gitsigns stage_hunk<CR>', {noremap = true})
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', {noremap = true})
map('n', '<leader>gw', ':Gitsigns stage_buffer<CR>', {noremap = true})
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', {noremap = true})

-- LSP
local opts = { noremap=true, silent=true }
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- Barbar
-- map('n', 'J', ':BufferNext<CR>', {noremap = true})
-- map('n', 'K', ':BufferPrevious<CR>', {noremap = true})
-- map('n', ':bd', ':BufferClose<CR>', {noremap = true})
-- map('n', '<leader>bb', ':BufferPick<CR>', {noremap = true})

-- Bufferline
map('n', 'J', ':BufferLineCycleNext<CR>', {noremap = true})
map('n', 'K', ':BufferLineCyclePrev<CR>', {noremap = true})
-- map('n', ':bd', ':BufferClose<CR>', {noremap = true})
map('n', '<leader>bb', ':BufferLinePick<CR>', {noremap = true})

-- Tags
map('n', '<leader>t', ':Tagbar<CR>', {noremap = true})

-- tab selects completion
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-n>'
--   elseif luasnip.expand_or_jumpable() then
--     return t '<Plug>luasnip-expand-or-jump'
--   elseif check_back_space() then
--     return t '<Tab>'
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
--
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t '<C-p>'
--   elseif luasnip.jumpable(-1) then
--     return t '<Plug>luasnip-jump-prev'
--   else
--     return t '<S-Tab>'
--   end
-- end

-- map({ 'i', 's' }, '<Tab>', 'v:lua.tab_complete()', { expr = true, noremap = false })
-- map({ 'i', 's' }, '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true, noremap = false })
