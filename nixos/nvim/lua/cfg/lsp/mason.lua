local settings = require("cfg.lsp.settings")

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason.setup({
      ui = {
        --icons = {
        --  package_installed = "",
        --  package_pending = "",
        --  package_uninstalled = "",
        --}
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "rust_analyzer",
        "clangd",
      },
      automatic_installation = true,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        local config = settings[server_name]
        if config == nil then config = {} end
        lspconfig[server_name].setup(config)
      end
    })
  end
}
