return {
  "folke/flash.nvim",
  event = "VeryLazy",

  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
    { "r", mode = { "o" },           function() require("flash").remote() end,            desc = "Flash Remote" },
    { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Flash TS Search" },
  },

  config = function()
    require("flash").setup({})
  end
}
