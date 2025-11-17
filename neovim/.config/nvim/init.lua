vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require("config.lazy")

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
      javascript = "100",
      python = "79",
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
