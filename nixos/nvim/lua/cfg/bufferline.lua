return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",

  lazy = false,

  keys = {
    -- switch to buffers
    { "<A-h>", mode = { "n" }, "<cmd>BufferLineCyclePrev<CR>", desc = "BufferLine previous tab" },
    { "<A-l>", mode = { "n" }, "<cmd>BufferLineCycleNext<CR>", desc = "BufferLine previous tab" },
    -- move from buffer to buffer
    { "H",     mode = { "n" }, "<cmd>BufferLineMovePrev<CR>",  desc = "BufferLine move tab <" },
    { "L",     mode = { "n" }, "<cmd>BufferLineMoveNext<CR>",  desc = "BufferLine move tab >" },
    -- close buffers
    { "<A-c>", mode = { "n" }, "<cmd>BufferLinePickClose<CR>", desc = "BufferLine close tab" },
  },

  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),

      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, level, _, _)
          if level == "error" then
            return " "
          elseif level == "warning" then
            return " "
          elseif level == "hint" then
            return ""
          end
        end,

        offsets = { { filetype = "NvimTree", text = "", text_align = "left" } },
      }
    })
  end
}
