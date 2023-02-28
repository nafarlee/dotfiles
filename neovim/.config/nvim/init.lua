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
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"mason.nvim"},
    opts = {
      automatic_installation = true,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { "mason-lspconfig.nvim"},
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.bashls.setup({})
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      automatic_installation = true,
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.shellcheck,
        },
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
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
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    'Olical/conjure',
    ft = {"clojure"}
  },
  {
    'hashicorp/sentinel.vim',
  },
  {
    'towolf/vim-helm',
  },
  {
    'vmchale/dhall-vim',
  },
  {
    'google/vim-jsonnet',
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
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config {
        virtual_text = false,
      }
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd "colorscheme catppuccin-latte"
    end
  },
  {
    'JManch/sunset.nvim',
    opts = {
      latitude = 39.833851,
      longitude = -74.871826,
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        under_cursor = false,
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      limit_to_window = true,
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    name = "lspsaga",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({})
      vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
      vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
    end
  },
})

vim.o.number = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.colorcolumn = '80'
vim.o.termguicolors = true

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
