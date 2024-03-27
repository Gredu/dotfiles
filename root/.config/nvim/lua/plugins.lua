-- Packer
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Themes
  -- use 'marko-cerovac/material.nvim'
  use { "HoNamDuong/hybrid.nvim" }

  use { "projekt0n/circles.nvim", requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}}}
  use 'cakebaker/scss-syntax.vim'
  use 'christoomey/vim-tmux-navigator'
  use { 'fatih/vim-go', ft = { 'go' }}
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'windwp/nvim-autopairs'
  use 'leafOfTree/vim-vue-plugin'
  use 'lervag/vimtex'
  use { 'lewis6991/gitsigns.nvim', requires= { 'nvim-lua/plenary.nvim' }}
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'mattn/emmet-vim', ft = { 'html', 'vue', 'svelte', 'javascript' }}
  use 'evanleck/vim-svelte'
  use {'rrethy/vim-hexokinase', run = 'make'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'plasticboy/vim-markdown'
  use 'rhysd/vim-grammarous'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use {'akinsho/bufferline.nvim', tag="v1.0.0", requires = 'kyazdani42/nvim-web-devicons'}
  use 'nvim-lua/completion-nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  use { 'junegunn/goyo.vim', ft = { 'markdown' }}
  use 'rafamadriz/friendly-snippets'
  use 'dhruvasagar/vim-table-mode'
  use 'github/copilot.vim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-cmp'
  -- use { 
  --   'glepnir/galaxyline.nvim',
  --   opt = true,
  --   branch = 'main',
  --   event = { 'VimEnter' },
  --   config = function()
  --     require 'conf.statusline'
  --   end,
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true } 
  -- }
end)
