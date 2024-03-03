return {
  lua_ls = {
    cmd = { "/run/current-system/sw/bin/lua-language-server" },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  rust_analyzer = {
    cmd = { "/run/current-system/sw/bin/rust-analyzer" },
    settings = {
      ["rust-analyzer"] = {
        procMacro = {
          enable = false,
        },
        cachePriming = {
          numThreads = 4,
        },
        diagnostics = {
          experimental = {
            enable = true,
          },
          disabled = {
            "unresolved-proc-macro"
          },
        },
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
          target = "x86_64-unknown-linux-gnu",
        },
      },
    },
  },
  clangd = {
    cmd = { "/run/current-system/sw/bin/clangd", "--fallback-style=google", "--clang-tidy", "-j", "8" },
    root_dir = function(fname)
      local lspconfig = require("lspconfig")
      local files = {
        'compile_commands.json',
        'Makefile',
        '.gitignore'
      }
      ---@diagnostic disable-next-line: deprecated
      return lspconfig.util.root_pattern(unpack(files))(fname) or lspconfig.util.find_git_ancestor(fname)
    end,
  },
  nixd = {
    cmd = { "/run/current-system/sw/bin/nixd" }
  }
}
