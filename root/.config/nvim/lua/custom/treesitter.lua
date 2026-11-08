local ensure_installed = {
  "javascript",
  "lua",
  "java",
  "php",
  "html",
  "css",
  "scss",
  "vim",
  "make",
  "bash",
  "python",
  "typescript",
  "svelte",
  "vue",
  "markdown",
  "markdown_inline",
}

-- The "main" branch API dropped the `ensure_installed` setup option; parsers
-- must be installed explicitly (this is a no-op once they're present).
require("nvim-treesitter").install(ensure_installed)

-- The "main" branch API no longer starts highlighting/indent automatically
-- (that was previously done by the old `highlight`/`indent` config modules).
-- "markdown_inline" is an injected-only language, never a buffer filetype.
local ts_filetypes = vim.tbl_filter(function(lang)
  return lang ~= "markdown_inline"
end, ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_filetypes,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
