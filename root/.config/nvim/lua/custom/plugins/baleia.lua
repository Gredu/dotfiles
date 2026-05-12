return {
  'm00qek/baleia.nvim',
  version = '*',
  config = function()
    vim.g.baleia = require("baleia").setup({ })
    vim.api.nvim_create_user_command("BaleiaColorize", function()
      vim.g.baleia.once(vim.api.nvim_get_current_buf())
    end, { bang = true })
    vim.api.nvim_create_user_command("BaleiaLogs", vim.cmd.messages, { bang = true })
  end,
}
