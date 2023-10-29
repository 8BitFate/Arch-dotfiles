return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>t", vim.cmd.ToggleTerm)
  end
}
