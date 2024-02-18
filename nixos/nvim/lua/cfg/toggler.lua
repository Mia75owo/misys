return {
  "nguyenvukhang/nvim-toggler",
  event = "VeryLazy",

  keys = {
    { "<leader>i", mode = { "n" }, function() require("nvim-toggler").toggle() end, desc = "Toggle (true <> false)" }
  },

  config = function()
    require("nvim-toggler").setup({
      inverses = {
        [ "0" ] = "1"
      },
      remove_default_keybindings = true,
    })
  end
}
