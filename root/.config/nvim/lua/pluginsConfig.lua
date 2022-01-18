-- Plugins Config

local cmd = vim.cmd
local g = vim.g


--  Gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '║', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '╣', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = false,
  numhl = true,
}

-- Telescope
require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top'
      },
    }
  }
}

-- Bufferline
require('bufferline').setup{
  options = {
    numbers = 'none',
    show_buffer_close_icons = false,
    close_icon = '',
    seperator_style = 'slant',
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and '✗ '
        -- or (e == "warning" and ' ' or ' ' )
        or (e == "warning" and ' ' or ' ' )
        s = s .. n .. sym
      end
      return s
    end
  }
}

-- Autopairs
require('nvim-autopairs').setup{}

-- Indent Blanklines
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true

-- Emmet
g.user_emmet_leader_key = '<c-e>'

-- Indent Blanklines
require('indent_blankline').setup {
  char = '¦',
  buftype_exclude = {'terminal'},
  filetype_exclude = {'dashboard', 'help', 'packer'},
  context_patterns = { "^for", "^if", "^object", "^table", "^while", "arguments", "block", "catch_clause", "class", "else_clause", "function", "if_statement", "import_statement", "jsx_element", "jsx_element", "jsx_self_closing_element", "method", "operation_type", "return", "try_statement", "element"}
}

-- LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').pyright.setup{cababilities=cababilities}
require('lspconfig').denols.setup{cababilities=cababilities}
require('lspconfig').vuels.setup{cababilities=cababilities}
require('lspconfig').bashls.setup{cababilities=cababilities}
require('lspconfig').intelephense.setup{cababilities=cababilities}

-- Circles
require('circles').setup({
  icons = {
    empty = '●',
    filled = '○',
    lsp_prefix = '✗';
  }
})

-- vim-markdown
g.vim_markdown_folding_disabled = 1

-- cmp completion
local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
