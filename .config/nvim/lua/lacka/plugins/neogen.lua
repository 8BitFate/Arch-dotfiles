return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    local neogen = require('neogen')
    neogen.setup()
    vim.keymap.set("n", "<Leader>nf", neogen.generate)
  end,
}
