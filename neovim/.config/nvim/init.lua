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
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    name = "lualine",
    opts = {
      options = { globalstatus = true },
    },
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'neovim/nvim-lspconfig',
  {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  {'jose-elias-alvarez/null-ls.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  "jayp0521/mason-null-ls.nvim",
  { 'lewis6991/gitsigns.nvim', config = true },
  { "windwp/nvim-autopairs", config = true },
  'Olical/conjure',
  'hashicorp/sentinel.vim',
  'towolf/vim-helm',
  'vmchale/dhall-vim',
  'google/vim-jsonnet',
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
  "RRethy/vim-illuminate",
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end
}
require("mason-null-ls").setup {
    automatic_setup = true,
}
require 'mason-null-ls'.setup_handlers()

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
