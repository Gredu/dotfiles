-- Indentation
local indent = 2
vim.o.shiftwidth = indent
vim.o.tabstop = indent
vim.o.expandtab = true
vim.o.softtabstop = indent

-- edge scroll
local edgeScroll = 5
vim.o.scrolloff = edgeScroll
vim.o.sidescrolloff = edgeScroll

-- directories and backups
vim.o.backupdir = vim.loop.os_homedir() .. '/.vim/backup'
vim.o.directory = vim.loop.os_homedir() .. '/.vim/tmp/'
vim.o.backup = true                       -- Make backup files

-- fold
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false                  -- auto
vim.o.foldcolumn = '0'

-- wildignores
-- opt.wildignore = vim.opt.wildignore + '*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so'
-- opt.wildignore = vim.opt.wildignore + '*/tmp/*'         --  MacOSX/Linux
-- opt.wildignore = vim.opt.wildignore + '*\\tmp\\*'       --  Windows'

-- splitting - more natural splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- general
-- opt.clipboard = vim.opt.clipboard + 'unnamed'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.cursorline = true
vim.o.fixendofline = false
vim.o.hidden = true                       -- You don't have to save constantly when switching between buffers
vim.o.incsearch = true                    -- Jumps right to the search
vim.o.lazyredraw = true                   -- Don't update display while executing macros
vim.o.mouse = 'a'                         -- Mouse
vim.o.number = true                       -- Line numbers
vim.o.rnu = true                          -- Relative numbers
vim.o.showmatch = true
vim.o.signcolumn = 'yes'
vim.o.ignorecase =  true
vim.o.smartcase = true                    -- Smarter case search
vim.o.wrap = false
vim.o.inccommand ="split"
vim.opt.formatoptions:remove({ 'r', 'o' })

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "MonoLisa,Symbols Nerd Font Mono:h14"

  vim.api.nvim_set_hl(0, "Cursor", { bg = "#FFA500" }) -- Bright orange cursor
  vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
