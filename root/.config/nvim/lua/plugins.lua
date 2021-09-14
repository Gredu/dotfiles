-- Packer
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Themes
  use { 'arcticicestudio/nord-vim', opt = true }
  use { 'micke/vim-hybrid', opt = true }
  use { 'monsonjeremy/onedark.nvim', opt = true }
  use {
    "projekt0n/circles.nvim",
    requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}}
  }
  use 'cakebaker/scss-syntax.vim'
  use 'christoomey/vim-tmux-navigator'
  use { 'fatih/vim-go', ft = { 'go' }}
  use 'itchyny/lightline.vim'
  use 'jiangmiao/auto-pairs'
  use 'leafOfTree/vim-vue-plugin'
  use 'lervag/vimtex'
  use { 'lewis6991/gitsigns.nvim', requires= { 'nvim-lua/plenary.nvim' }}
  use 'lukas-reineke/indent-blankline.nvim'
  use 'majutsushi/tagbar'
  use { 'mattn/emmet-vim', ft = { 'html', 'vue', 'javascript' }}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } 
  use 'plasticboy/vim-markdown'
  use 'rhysd/vim-grammarous'
  use 'ryanoasis/vim-devicons'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'nvim-lua/completion-nvim'
  use 'neovim/nvim-lspconfig'
  use { 'junegunn/goyo.vim', ft = { 'markdown' }}
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
