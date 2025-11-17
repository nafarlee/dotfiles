local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  checker = { enabled = true },
  spec = {
    { import = "plugins" },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
      },
      keys = {
        { "<C-p>", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      },
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {'nvim-tree/nvim-web-devicons'},
      opts = {
        options = { globalstatus = true },
        sections = {
          lualine_b = {
            'branch',
            'diff',
            'diagnostics',
            {
              'macro',
              fmt = function()
                local reg = vim.fn.reg_recording()
                if reg == "" then return nil end
                return "Recording @" .. reg
              end,
            },
          },
        },
      },
    },
    {
      'lewis6991/gitsigns.nvim',
      config = true,
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          incremental_selection = { enable = true },
          indent = { enable = true }
        }
      end
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      dependencies = {"nvim-treesitter/nvim-treesitter"},
      config = function()
        require("treesitter-context").setup()
      end,
    },
    {
      "gpanders/nvim-parinfer",
      ft = {"scheme", "clojure", "janet"},
    },
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        vim.cmd("colorscheme rose-pine")
      end
    },
    {
      "f-person/auto-dark-mode.nvim",
      opts = {}
    },
    {
      "Olical/conjure",
      ft = {"janet"},
      init = function()
        vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
        vim.g["conjure#client#scheme#stdio#command"] = "gxi"
        vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
        vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
      end,
    },
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      opts = {},
    },
  },
  checker = { enabled = true },
})
