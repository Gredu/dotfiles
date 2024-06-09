require("nvim-treesitter.configs").setup {
  ensure_installed = {"javascript" , "lua", "java", "php", "html", "css", "scss", "vim", "make", "bash", "python", "typescript", "svelte", "vue"},
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
