return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local tree = require 'nvim-tree'
    local api = require 'nvim-tree.api'

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', '<Space>', api.node.open.edit, opts('Open'))
    end

    tree.setup({
      hijack_cursor = true,
      sort_by = 'case_sensitive',
      view = {
        centralize_selection = true,
        width = 35,
        number = true,
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        full_name = true,
        highlight_opened_files = 'name',
        highlight_modified = 'icon',
      },
      filters = {
      },
      on_attach = my_on_attach,
    })

    vim.keymap.set('n', '<leader>e', function()
      if api.tree.is_tree_buf() then
        api.tree.close()
      else
        api.tree.focus()
      end
    end)
  end
}
