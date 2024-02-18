return {
  "pianocomposer321/yabs.nvim",
  cmd = { "YabsDefaultTask", "YabsTask" },
  config = function()
    require("yabs"):setup({
    })
  end
}
