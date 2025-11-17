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

require("lazy").setup({
  checker = { enabled = true },
  spec = {
    { import = "plugins" },
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
          auto_install = true,
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
      ft = {"scheme", "clojure", "janet"},
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
    {
      "Olical/conjure",
      ft = {"janet"},
      init = function()
        vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
        vim.g["conjure#client#scheme#stdio#command"] = "gxi"
        vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
        vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
      end,
    },
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      opts = {},
    },
  },
  checker = { enabled = true },
})
