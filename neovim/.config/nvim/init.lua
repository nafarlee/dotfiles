local fn = vim.fn
local map = vim.api.nvim_set_keymap
local opt = vim.opt

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end
require "paq" {
  'savq/paq-nvim';
  'itchyny/lightline.vim';
  'joshdick/onedark.vim';
  'nvim-treesitter/nvim-treesitter';
  'dense-analysis/ale';
  'nvim-telescope/telescope.nvim';
  'nvim-lua/plenary.nvim';
  'mhinz/vim-signify';
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "haskell" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

vim.cmd 'colorscheme onedark'
opt.number = true
opt.wrap = false
opt.ignorecase = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.termguicolors = true
opt.colorcolumn = '100'
opt.updatetime = 100

vim.g.mapleader = ' '
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
map('n', '<tab>', '<cmd>Telescope git_files<CR>', {})
