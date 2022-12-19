local fn = vim.fn
local map = vim.api.nvim_set_keymap
local opt = vim.opt

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'neovim/nvim-lspconfig'
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {'jose-elias-alvarez/null-ls.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'jiangmiao/auto-pairs'
  use 'Olical/conjure'
  use 'bhurlow/vim-parinfer'
  use 'hashicorp/sentinel.vim'
  use 'towolf/vim-helm'
  use 'vmchale/dhall-vim'
  use 'google/vim-jsonnet'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end
}

vim.diagnostic.config {
  virtual_text = false,
}

require('null-ls').setup {
  sources = {
    require('null-ls').builtins.diagnostics.shellcheck,
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true }
}

require'lualine'.setup {
  options = {
    globalstatus = true,
  },
}

opt.number = true
opt.wrap = false
opt.ignorecase = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.colorcolumn = '80'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
map('n', '<Space>', '', {})
map('i', 'jk', '<esc>', {})
map('i', 'kj', '<esc>', {})
map('n', '<Up>', ':wincmd k<CR>', {})
map('n', '<Down>', ':wincmd j<CR>', {})
map('n', '<Left>', ':wincmd h<CR>', {})
map('n', '<Right>', ':wincmd l<CR>', {})
map('n', '<Leader>n', ':bn<CR>', {})
map('n', '<Leader>.', ':vertical resize -10<CR>', {})
map('n', '<Leader>,', ':vertical resize +10<CR>', {})
map('n', '<C-p>', '<cmd>Telescope git_files<CR>', {})

vim.api.nvim_command('autocmd FileType go setlocal noexpandtab ts=2')

local date = os.date("*t")
if (date.hour == 16 and date.min > 30) or date.hour > 16 or date.hour < 7 then
  vim.api.nvim_command "colorscheme catppuccin-mocha"
else
  vim.api.nvim_command "colorscheme catppuccin-latte"
end
