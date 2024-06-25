return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-symbols.nvim',
    },
    config = function()
      require("custom.telescope")
    end
  }
}
