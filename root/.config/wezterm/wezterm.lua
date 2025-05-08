local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'
config.colors = {
  cursor_bg = 'orange',
  cursor_border = 'orange'
}

config.font_size = 10.0
config.font = wezterm.font_with_fallback {
  -- { family = 'MonoLisa',  weight = 'Book' },  -- Book might look better in linux or if github source is different?
  { family = 'MonoLisa' },
  { family = 'Symbols Nerd Font Mono' }
}

config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.max_fps = 120

return config
