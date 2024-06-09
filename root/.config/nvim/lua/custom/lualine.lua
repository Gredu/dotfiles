require("lualine").setup {
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
