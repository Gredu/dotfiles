local opt = vim.opt

-- Indentation
local indent = 2
opt.shiftwidth = indent
opt.tabstop = indent
opt.expandtab = true
opt.softtabstop = indent

-- edge scroll
local edgeScroll = 5
opt.scrolloff = edgeScroll
opt.sidescrolloff = edgeScroll

-- directories and backups
opt.backupdir = vim.loop.os_homedir() .. '/.vim/backup'
opt.directory = vim.loop.os_homedir() .. '/.vim/tmp/'
opt.backup = true                       -- Make backup files

-- fold
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false                  -- auto
opt.foldcolumn = '0'

-- wildignores
-- opt.wildignore = vim.opt.wildignore + '*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so'
-- opt.wildignore = vim.opt.wildignore + '*/tmp/*'         --  MacOSX/Linux
-- opt.wildignore = vim.opt.wildignore + '*\\tmp\\*'       --  Windows'

-- splitting - more natural splitting
opt.splitbelow = true
opt.splitright = true

-- general
-- opt.clipboard = vim.opt.clipboard + 'unnamed'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noinsert,noselect'
opt.cursorline = true
opt.fixendofline = false
opt.hidden = true                       -- You don't have to save constantly when switching between buffers
opt.incsearch = true                    -- Jumps right to the search
opt.lazyredraw = true                   -- Don't update display while executing macros
opt.mouse = 'a'                         -- Mouse
opt.number = true                       -- Line numbers
opt.rnu = true                          -- Relative numbers
opt.shortmess = vim.opt.shortmess + 'c'
opt.showmatch = true
opt.signcolumn = 'yes'
opt.ignorecase =  true
opt.smartcase = true                    -- Smarter case search
opt.wrap = false
opt.inccommand ="split"
opt.formatoptions:remove "o"            -- Don't add comment when `o`

-- Autocommands
-- vim.api.nvim_command('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
-- vim.api.nvim_create_autocmd(
--   'FileType',
--   { pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
--     command = 'set wrap lbr'
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   'FileType',
--   { pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
--     command = 'nnoremap j gj'
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   'FileType',
--   { 
--     pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
--     command = 'nnoremap k gk'
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   { 'BufRead', 'BufNewFile' },
--   { 
--     pattern = '*.underscore',
--     command = 'set syntax=html',
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   { 'BufRead', 'BufNewFile' },
--   { 
--     pattern = '*.underscore',
--     command = 'set filetype=html',
--   }
-- )
