local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'
config.colors = {
  cursor_bg = 'orange',
  cursor_border = 'orange'
}

config.font_size = 8.0
config.font = wezterm.font_with_fallback {
  { family = 'MonoLisa',  weight = 'Book' },
  { family = 'Symbols Nerd Font Mono' }
}

config.enable_tab_bar = false

return config
