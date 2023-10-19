local opt = vim.opt
local g = vim.g
-- general
opt.termguicolors = true
opt.undofile = true
opt.autoread = true
opt.fileformats = { 'unix', 'dos', 'mac'}

-- indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.autoindent = true
opt.smartindent = true

-- remove trialing whitespaces on save
vim.api.nvim_create_autocmd({ "bufwritepre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- cursor
opt.mouse = 'a'
opt.cursorline = true

opt.scrolloff = 25
opt.sidescrolloff = 15

-- Column
opt.number = true
opt.relativenumber = true
opt.ruler = true

opt.signcolumn = "yes"

-- Spliting
opt.splitbelow = true
opt.splitright = true

-- Wraping
opt.display = 'lastline'
opt.whichwrap:append "<>[]hl"

-- Key bindings

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lambdalisue/suda.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug "rafamadriz/friendly-snippets"
Plug "lukas-reineke/indent-blankline.nvim"
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mg979/vim-visual-multi'

vim.call('plug#end')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Colors Scheme
require('monokai').setup {}

require("toggleterm").setup()
require("ibl").setup()
require("nvim-autopairs").setup{}
