require("telescope").setup {
  defaults = {
    disable_devicons = true,
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top'
      },
    },
  },
  pickers = {
    find_files = {
      disable_devicons = true
    }
  },
}
