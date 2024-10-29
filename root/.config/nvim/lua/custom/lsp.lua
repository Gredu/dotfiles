require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup{}
  end
}
require('lspconfig').volar.setup({
  -- NOTE: Uncomment to enable volar in file types other than vue.
  -- (Similar to Takeover Mode)

  -- filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
  init_options = {
    vue = {
      hybridMode = false,
    },
    -- NOTE: This might not be needed. Uncomment if you encounter issues.

    -- typescript = {
    --   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    -- },
  },
})
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
require("lspconfig").ts_ls.setup({
  -- NOTE: To enable Hybrid Mode, change hybrideMode to true above and uncomment the following filetypes block.
  -- WARN: THIS MAY CAUSE HIGHLIGHTING ISSUES WITHIN THE TEMPLATE SCOPE WHEN ts_ls ATTACHES TO VUE FILES

  -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = volar_path,
        languages = { "vue" },
      },
    },
  },
})
require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
})
require('lspsaga').setup({
  -- code_action_prompt = { enabled = false}
  ui = {
    code_action = ''
  }
})
