return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,

  keys = {
    { "qq", mode = { "n" }, "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },

  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,

      hijack_directories = {
        enable = true,
        auto_open = true,
      },

      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },

      filters = {
        dotfiles = false,
        custom = {
          "^\\.git",
          "^\\.ninja_log",
          "^\\.yarn",
          "^\\.cache",

          "^node_modules",
          "^Cargo.lock",
          "^yarn.lock",
          "^compile_commands.json",

          "^.*\\.class",
          "^.*\\.o",
          "^.*\\.d",
          "^.*\\.gch",
        }
      },

      view = {
        width = 30,
        side = 'left',
      },

      renderer = {
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
          },
        },
        special_files = {
        }
      },
      git = {
        enable = true,
        ignore = true,
      }
    })
  end
}
