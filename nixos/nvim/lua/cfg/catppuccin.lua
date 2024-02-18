return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          FloatBorder = { fg = colors.purple },
        }
      end
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end
}
