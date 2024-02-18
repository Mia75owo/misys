return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  tag = "v1.0.0",
  config = function()
    require("fidget").setup({
      notification = {
        window = {
          winblend = 0,
          border = "rounded",
        }
      }
    })
  end
}
