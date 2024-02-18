return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",

  keys = {
    { "##", mode = { "n" }, "gcc", remap = true, desc = "Comment line" },
    { "##", mode = { "v" }, "gc",  remap = true, desc = "Comment selected lines" },
  },

  config = function()
    require("Comment").setup({
    })
  end
}
