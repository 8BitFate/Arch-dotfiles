return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local tterm = require('toggleterm')
    tterm.setup()
    vim.keymap.set('n', '<leader>t', vim.cmd.ToggleTerm)
  end
}
