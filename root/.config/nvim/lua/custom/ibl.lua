vim.api.nvim_set_hl(0, "IblScope", { fg = "#875f00", nocombine = true })

require('ibl').setup {
  indent = {
    char = '¦',
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    highlight = { "IblScope" },
  },
}
