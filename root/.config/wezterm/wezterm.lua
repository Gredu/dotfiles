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
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 50

config.max_fps = 120

local act = wezterm.action

config.keys = {
  { key = 'k', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },

  { key = 'v', mods = 'ALT', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 's', mods = 'ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  -- Conflicts with Yabai
  -- { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  { key = 'k', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(-1) },
  { key = 'j', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(1) },
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
    theme_overrides = {
      tab = {
        active = { fg = '#b6bcba', bg = '#161719' },
        inactive = { fg = '#6491b3', bg = '#30343a' },
      },
    },
    section_separators = '',
    component_separators = '',
    tab_separators = '',
  },
  sections = {
    tabline_a = {{  'mode', fmt = function(str) return str:sub(1,1) end }},
    tabline_b = { '' },
    tabline_c = { '' },
    tab_active = { 'index',
      { 'process', padding = { left = 0, right = 0 } },
      { 'cwd' },
    },
    tab_inactive = { 'index',
      { 'process', padding = { left = 0, right = 1 } },
      { 'cwd' },
    },
    tabline_x = { '' },
    tabline_y = { '' },
    tabline_z = { '' },
  },
  extensions = {},
})

return config
