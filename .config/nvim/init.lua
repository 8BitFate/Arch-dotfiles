-- general
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.autochdir = true

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec("normal! g'\"", false)
    end
  end,
})

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- remove trialing whitespaces on save
vim.api.nvim_create_autocmd({ "bufwritepre" }, {
  pattern = { "*" },
  callback = function(ev)
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- cursor
vim.opt.mouse = "a"
vim.opt.cursorline = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 15

vim.opt.showmatch = true

-- Column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

vim.opt.signcolumn = "yes"

-- Spliting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Wraping
vim.opt.display = "lastline"
vim.opt.whichwrap:append("<>[]hl")

-- Leader
vim.g.mapleader = ";"

-- copy and paste
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Open explorer
vim.keymap.set("n", "<leader>e", ":Lexplore<cr>")

-- Fold with space
vim.keymap.set("n", "<space>", "za")

-- Move lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Duplicate current line
vim.keymap.set("n", "<C-d>", "yypg;")
vim.keymap.set("i", "<C-d>", "<esc>yypgi")

-- Format
vim.keymap.set("n", "<leader><space>", vim.lsp.buf.format)
-- Quick insert mode exit
vim.keymap.set("i", ";f", "<Esc>")

-- Unhighlight
vim.keymap.set("n", "<Esc>", ":nohlsearch<return><Esc>", { silent = true })
vim.keymap.set("n", "<C-l>", ':let @/ = ""<return><C-l>')

-- Easy newline from normal mode
vim.keymap.set("n", "<C-CR>", "o<Esc>")
vim.keymap.set("n", "<C-S-CR>", "O<Esc>")

-- Newline without comment
vim.keymap.set("n", "<CR>", "<C-CR>^D", { remap = true })
vim.keymap.set("n", "<S-CR>", "<C-S-CR>^D", { remap = true })

-- Jump to empty newline in insert mode
vim.keymap.set("i", "<S-CR>", "<ESC><CR>A", { remap = true })
vim.keymap.set("i", "<C-S-CR>", "<ESC><C-CR>A", { remap = true })

-- Moving between buffers
vim.keymap.set("n", "<C-j>", ":bnext<CR>")
vim.keymap.set("n", "<C-k>", ":bprevious<CR>")

-- Plugins
require("lacka.lazy")

-- Netrw config
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

vim.api.nvim_create_autocmd("filetype", {
  pattern = "netrw",
  desc = "Mappings for netrw",
  callback = function()
    vim.keymap.set("n", "<space>", "<CR>", { remap = true, buffer = true })
  end,
})


-- :W to sudo save files
vim.api.nvim_create_user_command("W", ":lua require'utils'.sudo_write()<CR>", {})
