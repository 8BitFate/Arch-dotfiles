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
    local lspconfig = require('lspconfig')
    local lsp_zero = require('lsp-zero')

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'eslint',
        'tsserver',
        'lua_ls',
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    lspconfig.tsserver.setup({})
  end
}
