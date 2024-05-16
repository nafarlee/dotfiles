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
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {},
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
    "echasnovski/mini.pairs",
    opts = {},
  },
  {
    'Olical/conjure',
    ft = {"clojure"}
  },
  {
    'towolf/vim-helm',
  },
  {
    'vmchale/dhall-vim',
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
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    'JManch/sunset.nvim',
    opts = {
      latitude = 39.833851,
      longitude = -74.871826,
    },
    lazy = false,
    priority = 1000,
    dependencies = {
      {
        "catppuccin/nvim",
        config = function()
          vim.cmd "colorscheme catppuccin-latte"
        end
      }
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
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter",
    },
    config = function()
      require("lspsaga").setup({
        definition = {
          width = 0.8,
          height = 0.7,
        },
        lightbulb = {
          enable = false,
        },
      })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
      vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
      vim.keymap.set("n", "<Leader>f", "<cmd>Lspsaga finder<CR>")
    end
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
vim.o.colorcolumn = '80'

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
