vim.g.mapleader = ' '
vim.g.maplocalleader = ','
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
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
      { "<C-p>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
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
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      'neovim/nvim-lspconfig',
    },
    opts = {
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    opts = {
      automatic_installation = false,
      handlers = {},
    },
  },
  {
    "nvimtools/none-ls.nvim",
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      options = { globalstatus = true },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    "echasnovski/mini.pairs",
    opts = {},
  },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true }
      }
    end
  },
  {
    "gpanders/nvim-parinfer",
    ft = {"scheme"},
  },
})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local colorcolumns = {
      racket = "102",
      scheme = "102",
    }
    vim.o.colorcolumn = colorcolumns[ft] or "80"
  end
})

vim.keymap.set('n', '<Space>', '')
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set('n', '<Up>', ':wincmd k<CR>')
vim.keymap.set('n', '<Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<Right>', ':wincmd l<CR>')
vim.keymap.set('n', '<Leader>n', ':bn<CR>')
vim.keymap.set('n', '<Leader>.', ':vertical resize -10<CR>')
vim.keymap.set('n', '<Leader>,', ':vertical resize +10<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<CR>')
