return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local catppuccin = require("catppuccin.palettes").get_palette("mocha")
    local theme = require("lualine.themes.catppuccin-mocha")

    theme.visual.a.bg = catppuccin.blue
    theme.normal.a.bg = catppuccin.pink

    require("lualine").setup({
      options = {
        theme = theme
      }
    })
  end
}
