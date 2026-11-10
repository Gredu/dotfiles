return {
  {
    'smart-splits-nvim/smart-splits.nvim',
    dependencies = {
      {
        -- also needs its WezTerm half, loaded in wezterm.lua
        'smart-splits-nvim/backend-wezterm',
        main = 'smart-splits-backend-wezterm',
        opts = {},
      },
    },
    opts = {
      mux = { backend = 'smart-splits-backend-wezterm' },
    },
  },
}
