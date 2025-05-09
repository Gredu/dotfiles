local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'
config.colors = {
  cursor_bg = 'orange',
  cursor_border = 'orange'
}

config.font_size = 10.0
config.font = wezterm.font_with_fallback {
  { family = 'MonoLisa' },
  { family = 'Symbols Nerd Font Mono' }
}

config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.max_fps = 120

local act = wezterm.action

config.keys = {
  { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
  -- { key = 's', mods = 'ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },  -- modded
  { key = '0', mods = 'SUPER', action = act.ResetFontSize },
  { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
  { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
  { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
  { key = '5', mods = 'ALT', action = act.ActivateTab(3) },
  { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
  { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
  { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
  { key = '9', mods = 'ALT', action = act.ActivateTab(-1) },

  { key = 'W', mods = 'ALT', action = act.CloseCurrentTab{ confirm = true } },
  { key = 't', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },

  { key = 'k', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },

  { key = 'v', mods = 'ALT', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 's', mods = 'ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  { key = 'j', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(-1) },
  { key = 'k', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(1) },
  { key = 'u', mods = 'SHIFT|CTRL', action = act.ScrollByPage(-1) },
  { key = 'd', mods = 'SHIFT|CTRL', action = act.ScrollByPage(1) },

  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },

  { key = 'l', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'k', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'j', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Down', 1 } },
  { key = 'h', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Left', 1 } },
}

-- Plugins
-- -------

-- Tabline
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Hybrid',
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = '',
    component_separators = '',
    tab_separators = '',
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})

return config
