return {{
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      "lua_ls",
      "shellcheck",
      "bashls",
      "oxlint",
      "oxfmt",
      "ts_ls",
      "regal",
      "eslint",
      "terraformls",
      "biome",
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    {"mason-org/mason.nvim", opts = {} },
    {"mason-org/mason-lspconfig.nvim", opts = {} },
  },
}}
