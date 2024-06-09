return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
   },
   config = function() 
     require("custom.lsp")
   end,
  },
}
