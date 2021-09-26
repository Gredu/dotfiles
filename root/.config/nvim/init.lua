-- Aliases
local cmd = vim.cmd
local fn = vim.fn
-- local g = vim.g
-- local map = vim.api.nvim_set_keymap
-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- Install packer if it is not installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('plugins')
require('general')
require('keymaps')
require('pluginsConfig')

-- Load old configs
cmd('source ' .. vim.loop.os_homedir() .. '/.config/nvim/oldInit.vim')
