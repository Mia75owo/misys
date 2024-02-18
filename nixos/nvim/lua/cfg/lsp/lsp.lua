local settings = require("cfg.lsp.settings")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },

  keys = {
    { "<leader>fm", mode = { "n" }, function() vim.lsp.buf.format({ tabSize = 2 }) end, desc = "Format File" }
  },

  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function()
    end

    for k, v in pairs(settings) do
      local setting = v
      setting.capabilities = capabilities
      setting.on_attach = on_attach

      lspconfig[k].setup(setting)
    end
  end
}
