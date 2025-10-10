require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config('vue_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
})

vim.lsp.enable('vue_ls')
