require("mason").setup()
require("mason-lspconfig").setup()

local vue_language_server_path = vim.fn.expand('$MASON/packages/vue-language-server/node_modules/@vue/language-server')

vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server_path,
            languages = { 'vue' },
            configNamespace = 'typescript',
          },
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.config('vue_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
})

vim.lsp.enable({ 'vtsls', 'vue_ls' })
