local fn = vim.fn
local map = vim.api.nvim_set_keymap
local opt = vim.opt

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end
require "paq" {
  'savq/paq-nvim',
  'hoob3rt/lualine.nvim',
  {'nvim-treesitter/nvim-treesitter', branch="0.5-compat"},
  'dense-analysis/ale',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'mhinz/vim-signify',
  'jiangmiao/auto-pairs',
  'sainnhe/everforest',
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "haskell" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = true }
}

require'lualine'.setup()

vim.cmd 'colorscheme everforest'
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
map('n', '<tab>', '<cmd>Telescope git_files<CR>', {})
