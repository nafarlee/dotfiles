local fn = vim.fn
local map = vim.api.nvim_set_keymap
local opt = vim.opt

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require('packer').startup(function(use)
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'dense-analysis/ale'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'mhinz/vim-signify'
  use 'jiangmiao/auto-pairs'
  use 'sainnhe/everforest'
  use 'Olical/conjure'
  use 'bhurlow/vim-parinfer'
  use 'hashicorp/sentinel.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  incremental_selection = { enable = true },
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
map('n', '<C-p>', '<cmd>Telescope git_files<CR>', {})

-- System-based color switching
local function is_dark()
  if 1 == fn.has("mac") then
    return fn.system("defaults read -g AppleInterfaceStyle"):find("Dark")
  elseif '' ~= fn.system('command -v xfconf-query') then
    return fn.system('xfconf-query -c xsettings -p /Net/ThemeName'):find('dark')
  elseif '' ~= fn.system('command -v gsettings') then
    return fn.system('gsettings get org.gnome.desktop.interface gtk-theme'):find('dark')
  end
end

if is_dark() then
  opt.background = 'dark'
else
  opt.background = 'light'
end
