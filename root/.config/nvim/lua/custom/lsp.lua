require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').bashls.setup{cababilities=cababilities}
require('lspconfig').denols.setup{cababilities=cababilities}
require('lspconfig').intelephense.setup{cababilities=cababilities}
require('lspconfig').jdtls.setup{cababilities=cababilities}
require('lspconfig').pyright.setup{cababilities=cababilities}
require('lspconfig').svelte.setup{cababilities=cababilities}
require('lspconfig').tsserver.setup{cababilities=cababilities}
require('lspconfig').eslint.setup{cababilities=cababilities}
