return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "nvimdev/lspsaga.nvim",
      "mfussenegger/nvim-lint",
   },
   config = function()
     require("custom.lsp")
   end,
  },
}
