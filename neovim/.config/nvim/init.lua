local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
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
    dependencies = {'kyazdani42/nvim-web-devicons'},
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
})

vim.opt.number = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {})
vim.api.nvim_set_keymap('i', 'kj', '<esc>', {})
vim.api.nvim_set_keymap('n', '<Up>', ':wincmd k<CR>', {})
vim.api.nvim_set_keymap('n', '<Down>', ':wincmd j<CR>', {})
vim.api.nvim_set_keymap('n', '<Left>', ':wincmd h<CR>', {})
vim.api.nvim_set_keymap('n', '<Right>', ':wincmd l<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>.', ':vertical resize -10<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>,', ':vertical resize +10<CR>', {})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope git_files<CR>', {})

vim.api.nvim_command('autocmd FileType go setlocal noexpandtab ts=2')
