-- Plugins Config
local o = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Github theme
-- g.material_terminal_italics = 1

-- Material theme
-- require('material').setup({
--    plugins = { -- Uncomment the plugins that you use to highlight them
--     -- "dap",
--     -- "dashboard",
--     "gitsigns",
--     -- "hop",
--     "indent-blankline",
--     -- "lspsaga",
--     -- "mini",
--     -- "neogit",
--     "nvim-cmp",
--     -- "nvim-navic",
--     "nvim-tree",
--     -- "sneak",
--     "telescope",
--     -- "trouble",
--     -- "which-key",
--   },
-- })

-- Colorscheme
-- o.background ='dark'
-- g.material_style = 'darker'
-- g.material_style = 'deep ocean'

-- cmd[[colorscheme minimal]] -- for minimal
-- cmd[[colorscheme material]] -- for minimal
-- cmd[[colorscheme hybrid]] -- for minimal
cmd.colorscheme("hybrid")

-- Vim Go
g.go_fmt_command = "goimports"

g.go_highlight_functions = 1
g.go_highlight_methods = 1
g.go_highlight_structs = 1
g.go_highlight_operators = 1
g.go_highlight_build_constraints = 1

-- Vim Vue
g.vim_vue_plugin_use_scss = 1
g.vim_vue_plugin_load_full_syntax = 1

-- Latex
g.tex_flavor = 'latex'

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '',
    section_separators = '',
  },
  sections = { 
    lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end }}
  }
}

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript" , "lua", "java", "php", "html", "css", "scss", "vim", "make", "bash", "python", "typescript", "svelte"},
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable= {},
    additional_vim_regex_higlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc",
    },
  },
}

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
    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      layout_strategy = 'horizontal',
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top'
        },
      },
    },
  },
}

require('telescope').load_extension 'file_browser'

-- Bufferline
require('bufferline').setup{
  options = {
    numbers = 'none',
    show_buffer_close_icons = false,
    close_icon = '',
    seperator_style = 'slant',
    diagnostics = 'nvim_lsp',
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   -- local s = '○'
    --   local s = ' '
    --   for e, n in pairs(diagnostics_dict) do
    --     local sym = e == 'error' and '✗ '
    --     or (e == "warning" and ' ' or ' ' )
    --     s = s .. n .. sym
    --   end
    --   return s
    -- end
  }
}

-- Autopairs
require('nvim-autopairs').setup{}

-- Indent Blanklines
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true

-- Emmet
g.user_emmet_leader_key = '<c-e>'

-- Indent Blanklines
require('ibl').setup {
  indent = { 
    char = '¦',
  },
  scope = {
    enabled = true,
    show_start = false,
  },
}

-- LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP Mason
require("mason").setup()
require("mason-lspconfig").setup()

require('lspconfig').tsserver.setup{cababilities=cababilities}
require('lspconfig').pyright.setup{cababilities=cababilities}
require('lspconfig').denols.setup{cababilities=cababilities}
require('lspconfig').vuels.setup{cababilities=cababilities}
require('lspconfig').bashls.setup{cababilities=cababilities}
require('lspconfig').intelephense.setup{cababilities=cababilities}
require('lspconfig').svelte.setup{cababilities=cababilities}
require('lspconfig').jdtls.setup{cababilities=cababilities}

-- Circles
require('circles').setup({
  icons = {
    empty = '●',
    filled = '○',
    -- lsp_prefix = '▪';
    -- lsp_prefix = '●';
    -- lsp_prefix = '█';
    lsp_prefix = '■';
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
    { name = 'vsnip' }, -- For vsnip users.
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
