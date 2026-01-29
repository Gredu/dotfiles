local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Hybrid'
config.colors = {
  cursor_bg = 'orange',
  cursor_border = 'orange'
}

if wezterm.target_triple:find('apple-darwin') then
  config.font_size = 8.0
else
  config.font_size = 10.0
end

config.font = wezterm.font_with_fallback {
  { family = 'MonoLisa' },
  { family = 'Symbols Nerd Font Mono' }
}

config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 50

config.max_fps = 120

local act = wezterm.action

local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(key)
  return {
    key = key,
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if pane:get_user_vars().IS_NVIM == "true" then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = "CTRL" },
        }, pane)
      else
        win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
      end
    end),
  }
end

config.keys = {

  -- Free Shift Enter to enter new line in gemini-cli
  { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n"), },

  -- {
  --   key = "Enter",
  --   mods = "SHIFT",
  --   action = function(win, pane)
  --     local process_name = pane:get_foreground_process_name()
  --     if process_name and string.find(process_name, "gemini-cli", 1, true) then
  --       win:perform_action(wezterm.action.SendString("\n"), pane)
  --     else
  --       win:perform_action(wezterm.action.SendString("\r"), pane)
  --     end
  --   end,
  -- },

  { key = 'k', mods = 'ALT', action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'ALT', action = act.ActivateTabRelative(1) },

  { key = 'v', mods = 'ALT', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = 's', mods = 'ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },

  { key = 'o', mods = 'ALT', action = act.TogglePaneZoomState },

  -- Conflicts with Yabai
  -- { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  { key = 'k', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(-1) },
  { key = 'j', mods = 'SHIFT|CTRL|ALT', action = act.MoveTabRelative(1) },
  { key = 'u', mods = 'SHIFT|CTRL', action = act.ScrollByPage(-1) },
  { key = 'd', mods = 'SHIFT|CTRL', action = act.ScrollByPage(1) },

  { key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }), },
  { key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }), },
  { key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }), },
  { key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }), },

  { key = 'l', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Right', 1 } },
  { key = 'k', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Up', 1 } },
  { key = 'j', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Down', 1 } },
  { key = 'h', mods = 'SHIFT|ALT|CTRL|SUPER', action = act.AdjustPaneSize{ 'Left', 1 } },

  { key = 't', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },

  split_nav("h"),
  split_nav("j"),
  split_nav("k"),
  split_nav("l"),
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

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
      { 'process', padding = { left = 0, right = 0 } },
      { 'cwd' },
    },
    tabline_x = { '' },
    tabline_y = { '' },
    tabline_z = { '' },
  },
  extensions = {},
})

return config
