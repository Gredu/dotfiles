local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Indentation
local indent = 2
o.shiftwidth = indent
o.tabstop = indent
o.expandtab = true
o.softtabstop = indent

-- edge scroll
local edgeScroll = 5
o.scrolloff = edgeScroll
o.sidescrolloff = edgeScroll

-- directories and backups
o.backupdir = vim.loop.os_homedir() .. '/.vim/backup'
o.directory = vim.loop.os_homedir() .. '/.vim/tmp/'
o.backup = true                       -- Make backup files

-- general
o.clipboard = vim.opt.clipboard + 'unnamed'
o.completeopt = 'menuone,noinsert,noselect'
o.cursorline = true
o.fixendofline = false
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldenable = false                   -- auto
o.foldcolumn = '0'
o.hidden = true                       -- You don't have to save constantly when switching between buffers
o.ignorecase =  true                  -- You always want this
o.incsearch = true                    -- Jumps right to the search
o.lazyredraw = true                   -- Don't update display while executing macros
o.mouse = 'a'                         -- Enable mouse
o.number = true                       -- Show line numbers
o.rnu = true                          -- Use relative numbers
o.shortmess = vim.opt.shortmess + 'c'
o.showmatch = true
o.signcolumn = 'yes'
o.smartcase = true                    -- Smarter case search
o.splitbelow = true                   -- Use more natural splitting
o.splitright = true                   -- --
o.termguicolors = true
o.wildignore = vim.opt.wildignore + '*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so'
o.wildignore = vim.opt.wildignore + '*/tmp/*'         --  MacOSX/Linux
o.wildignore = vim.opt.wildignore + '*\\tmp\\*'       --  Windows'
o.wrap = false

g.mapleader = ' '

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
