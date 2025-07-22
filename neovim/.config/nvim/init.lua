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

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require("lazy").setup({
  checker = { enabled = true },
  spec = {
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
      "mason-org/mason.nvim",
      opts = {},
    },
    "mason-org/mason-lspconfig.nvim",
    'neovim/nvim-lspconfig',
    "nvimtools/none-ls.nvim",
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
          ensure_installed = "all",
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
      ft = {"scheme", "clojure"},
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
  },
  checker = { enabled = true },
})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

vim.o.cmdheight = 0
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
