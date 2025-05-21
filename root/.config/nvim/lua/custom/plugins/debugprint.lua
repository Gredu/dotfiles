return {
  "andrewferrier/debugprint.nvim",
  dependencies = {
    "echasnovski/mini.nvim",         -- Optional: Needed for line highlighting (full mini.nvim plugin)
    "nvim-telescope/telescope.nvim", -- Optional: If you want to use the :SearchDebugPrints command with telescope.nvim
  },
  config = function()
    require('debugprint').setup {
      -- config
    }
  end,
  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = "*", -- Remove if you DON'T want to use the stable version
}
