return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      mappings = {
        n = {
          ['<space>'] = 'select_default',
        },
      },
    },
  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', builtin.commands, {})
    vim.keymap.set('n', '<C-f>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>c', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>a', builtin.git_files)
    vim.keymap.set('n', '<leader>h', builtin.command_history, {})
    vim.keymap.set('n', '<leader>s', builtin.search_history, {})
    vim.keymap.set('n', '<leader>m', builtin.marks, {})
  end
}
