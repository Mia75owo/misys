-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██║   ██║██║████╗ ████║
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local globals = require("globals")
local srequire = globals.save_require

srequire("nvimcfg")

local plugins = {
  srequire("cfg.catppuccin"),
  srequire("cfg.nvim-tree"),
  srequire("cfg.lualine"),
  srequire("cfg.bufferline"),
  srequire("cfg.notify"),
  srequire("cfg.autopair"),
  srequire("cfg.dressing"),
  srequire("cfg.treesitter"),
  srequire("cfg.comments"),
  srequire("cfg.nvim-cmp"),
  srequire("cfg.nvim-colorizer"),
  srequire("cfg.todocomments"),
  srequire("cfg.flash"),
  srequire("cfg.toggler"),
  srequire("cfg.telescope"),
  srequire("cfg.whichkey"),
  srequire("cfg.yabs"),
  srequire("cfg.lsp.lsp"),
  srequire("cfg.lsp.lspsaga"),
  srequire("cfg.lsp.fidget"),
  srequire("cfg.lsp.lspsignature"),
}

srequire("lazy").setup(plugins, {
  install = {
    colorscheme = { "catppuccin-mocha" }
  }
})
