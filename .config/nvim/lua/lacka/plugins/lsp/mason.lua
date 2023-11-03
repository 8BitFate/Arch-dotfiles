return {
  'williamboman/mason.nvim',
  dependencies = {
    {
      'williamboman/mason-lspconfig.nvim',
    },
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lsp_zero = require('lsp-zero')

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'eslint',
        'lua_ls',
      },
      handlers = {
        lsp_zero.default_setup,
      },
    }
    )
  end
}
