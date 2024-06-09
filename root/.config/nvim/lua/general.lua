-- Indentation
local indent = 2
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.expandtab = true
vim.opt.softtabstop = indent

-- edge scroll
local edgeScroll = 5
vim.opt.scrolloff = edgeScroll
vim.opt.sidescrolloff = edgeScroll

-- directories and backups
vim.opt.backupdir = vim.loop.os_homedir() .. '/.vim/backup'
vim.opt.directory = vim.loop.os_homedir() .. '/.vim/tmp/'
vim.opt.backup = true                       -- Make backup files

-- general
vim.opt.clipboard = vim.opt.clipboard + 'unnamed'
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cursorline = true
vim.opt.fixendofline = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false                   -- auto
vim.opt.foldcolumn = '0'
vim.opt.hidden = true                       -- You don't have to save constantly when switching between buffers
vim.opt.ignorecase =  true                  -- You always want this
vim.opt.incsearch = true                    -- Jumps right to the search
vim.opt.lazyredraw = true                   -- Don't update display while executing macros
vim.opt.mouse = 'a'                         -- Enable mouse
vim.opt.number = true                       -- Show line numbers
vim.opt.rnu = true                          -- Use relative numbers
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showmatch = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true                    -- Smarter case search
vim.opt.splitbelow = true                   -- Use more natural splitting
vim.opt.splitright = true                   -- --
vim.opt.termguicolors = true
vim.opt.wildignore = vim.opt.wildignore + '*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so'
vim.opt.wildignore = vim.opt.wildignore + '*/tmp/*'         --  MacOSX/Linux
vim.opt.wildignore = vim.opt.wildignore + '*\\tmp\\*'       --  Windows'
vim.opt.wrap = false

vim.g.mapleader = ' '

-- Autocommands
-- vim.api.nvim_command('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
vim.api.nvim_create_autocmd(
  'FileType',
  { pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
    command = 'set wrap lbr'
  }
)
vim.api.nvim_create_autocmd(
  'FileType',
  { pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
    command = 'nnoremap j gj'
  }
)
vim.api.nvim_create_autocmd(
  'FileType',
  { 
    pattern = { 'markdown', 'mkd', 'txt', 'tex', 'fountain' },
    command = 'nnoremap k gk'
  }
)
vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  { 
    pattern = '*.underscore',
    command = 'set syntax=html',
  }
)
vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  { 
    pattern = '*.underscore',
    command = 'set filetype=html',
  }
)
