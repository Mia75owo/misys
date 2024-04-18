local tabwidth = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = tabwidth
vim.opt.softtabstop = tabwidth
vim.opt.tabstop = tabwidth

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = false
vim.opt.termguicolors = false
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.pumheight = 10
vim.g.mapleader = " "

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

local map = function(mode, key, cmd, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, key, cmd, opts)
end

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("v", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("v", "p", '"_dP')
map("n", "<A-j>", "<cmd>m+1<cr>", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m-2<cr>", { desc = "Move line up" })
map("v", "<A-j>", "<cmd>m .+1<CR>", { desc = "Move lines down" })
map("v", "<A-k>", "<cmd>m .-2<CR>", { desc = "Move lines up" })
map("n", "<Leader>y", '"+y')
map("v", "<Leader>y", '"+y')
map("n", "<Leader>d", '"+d')
map("v", "<Leader>d", '"+d')
