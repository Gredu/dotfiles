return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.notify").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
    end,
  },
}
