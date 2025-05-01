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

config.enable_tab_bar = false

return config
