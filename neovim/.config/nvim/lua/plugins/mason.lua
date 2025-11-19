return {{
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      "lua_ls",
      "bashls",
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    {"mason-org/mason.nvim", opts = {} },
    {"mason-org/mason-lspconfig.nvim", opts = {} },
  },
}}
