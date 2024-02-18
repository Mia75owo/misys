return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  event = "VeryLazy",

  keys = {
    { "<leader>sf", mode = { "n" }, "<cmd>Telescope find_files<CR>", desc = "Telescope find file" },
    { "<leader>es", mode = { "n" }, "<cmd>Telescope diagnostics<CR>", desc = "Telescope LSP diagnostics" },
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({})
    telescope.load_extension("fzf")
  end
}
