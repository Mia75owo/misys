return {
  "nvimdev/lspsaga.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "LspAttach",

  keys = {
    { "<A-t>",      mode = { "n" }, "<cmd>Lspsaga term_toggle<CR>",          desc = "Toggle FloatTerm" },

    { "<leader>en", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "LSP jump to next diagnostic" },
    { "<leader>eN", mode = { "n" }, "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "LSP jump to prev diagnostic" },

    { "<leader>ef", mode = { "n" }, "<cmd>Lspsaga code_action<CR>",          desc = "LSP show code actions" },
    { "<leader>rn", mode = { "n" }, "<cmd>Lspsaga rename<CR>",               desc = "LSP rename" },
    { "<leader>lf", mode = { "n" }, "<cmd>Lspsaga finder<CR>",               desc = "LSP find references" },
    { "<leader>hd", mode = { "n" }, "<cmd>Lspsaga hover_doc<CR>",            desc = "LSP hover doc" },
    { "<leader>ld", mode = { "n" }, "<cmd>Lspsaga preview_definition<CR>",   desc = "LSP preview definition" },
    { "<leader>lD", mode = { "n" }, "<cmd>Lspsaga goto_definition<CR>",      desc = "LSP goto definition" },
  },

  config = function()
    require("lspsaga").setup({
    })
  end
}
