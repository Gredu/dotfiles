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
config.hide_tab_bar_if_only_one_tab = true

config.max_fps = 120

-- config.tab_max_width = 50

-- -- 161719 current background
--
-- -- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
--
-- -- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
--
-- -- This function returns the suggested title for a tab.
-- -- It prefers the title that was set via `tab:set_title()`
-- -- or `wezterm cli set-tab-title`, but falls back to the
-- -- title of the active pane in that tab.
-- function tab_title(tab_info)
--   local title = tab_info.tab_title
--   -- if the tab title is explicitly set, take that
--   if title and #title > 0 then
--     return title
--   end
--   -- Otherwise, use the title from the active pane
--   -- in that tab
--   return tab_info.active_pane.title
-- end

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     -- local edge_background = '#0b0022'
--     local edge_background = '#161719'
--     -- local background = '#1b1032'
--     local background = '#333333'
--     local foreground = '#808080'
--
--     if tab.is_active then
--       background = '#161719'
--       foreground = '#ffa622'
--     elseif hover then
--       background = '#333333'
--       foreground = '#909090'
--     end
--
--     local edge_foreground = background
--
--     local title = tab_title(tab)
--
--     -- ensure that the titles fit in the available space,
--     -- and that we have room for the edges.
--     -- title = wezterm.truncate_right(title, max_width + 22)
--
--     return {
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       -- { Text = SOLID_LEFT_ARROW },
--       { Text = ' ' },
--       { Background = { Color = background } },
--       { Foreground = { Color = foreground } },
--       { Text = title },
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       { Text = ' ' },
--       -- { Text = SOLID_RIGHT_ARROW },
--     }
--   end
-- )

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

  { key = 'v', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 's', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

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

return config
