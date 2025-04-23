vim.cmd([[ highlight IblScope guifg=#545c7e gui=nocombine ]])

require('ibl').setup {
  indent = {
    char = '¦',
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    highlight = { "IblScope" },
  },
}
