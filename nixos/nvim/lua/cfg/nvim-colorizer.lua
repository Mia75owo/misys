return {
  "norcalli/nvim-colorizer.lua",
  cmd = { "ColorizerToggle" },

  keys = {
    { "<leader>ct", mode = { "n" }, "<cmd>ColorizerToggle<CR>", desc = "Enable Color Highlighting" },
  };

  config = function()
    require("colorizer").setup({})
  end
}
