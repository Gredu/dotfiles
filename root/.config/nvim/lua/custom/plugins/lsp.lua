return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      'nvimdev/lspsaga.nvim',
   },
   config = function()
     require("custom.lsp")
   end,
  },
}
