return {
  "altermo/ultimate-autopair.nvim",
  event = "InsertEnter",
  config = function()
    require("ultimate-autopair").setup({})
  end
}
