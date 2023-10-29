return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["<space>"] = "select_default",
        },
      },
    },
  },
  config = function()
    local telescope = require("telescope")

    --vim.keymap.set("n", "<C-p>", telescope.builtin.commands, {})
    --vim.keymap.set("n", "<C-f>", telescope.builtin.find_files, {})
    --vim.keymap.set("n", "<leader>f", telescope.builtin.live_grep, {})
    --vim.keymap.set("n", "<leader>b", telescope.builtin.buffers, {})
    --vim.keymap.set("n", "<leader>c", telescope.builtin.git_commits, {})
    --vim.keymap.set("n", "<leader>a", telescope.builtin.git_files)
    --vim.keymap.set("n", "<leader>h", telescope.builtin.command_history, {})
    --vim.keymap.set("n", "<leader>s", telescope.builtin.search_history, {})
    --vim.keymap.set("n", "<leader>m", telescope.builtin.marks, {})
  end
}
