return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function() 
      require("custom.ibl")
    end,
  },
}
