return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function()
    local lsp_signature = require("lsp_signature")
    local cfg = {
      bind = true,
      floating_window = true,
      doc_lines = 0,
      hint_enable = true,
      hint_prefix = "",
    }
    lsp_signature.setup(cfg)
    lsp_signature.on_attach(cfg)
  end
}
