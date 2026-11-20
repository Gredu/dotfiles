-- require "custom.snippets"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

-- local lspkind = require "lspkind"
-- lspkind.init {}

local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    -- { name = "cody" },
    { name = "path" },
    { name = "buffer" },
    { name = 'render-markdown' },
  },
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    -- ["<C-y>"] = cmp.mapping(
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
    { "i", "c" }
  ),
  },

  -- Enable luasnip to handle snippet expansion for nvim-cmp
  -- snippet = {
  --   expand = function(args)
  --     vim.snippet.expand(args.body)
  --   end,
  -- },
}

-- Email addresses from notmuch in aerc's To/Cc/Bcc/From headers
require("custom.notmuch_address").register()
cmp.setup.filetype("mail", {
  sources = {
    { name = "notmuch_address", keyword_length = 2 },
    { name = "path" },
    { name = "buffer" },
  },
})

-- Setup up vim-dadbod
-- cmp.setup.filetype({ "sql" }, {
--   sources = {
--     { name = "vim-dadbod-completion" },
--     { name = "buffer" },
--   },
-- })
