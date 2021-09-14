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
require('lspconfig').pyright.setup{on_attach=require('completion').on_attach}
-- require('lspconfig').denols.setup{on_attach=require('completion').on_attach}
require('lspconfig').denols.setup{on_attach=require('completion').on_attach}
-- require('lspconfig').vuels.setup{on_attach=require('completion').on_attach}
require('lspconfig').vuels.setup{on_attach=require('completion').on_attach}
require('lspconfig').bashls.setup{on_attach=require('completion').on_attach}

-- Prefix with let g:indent_blankline

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
