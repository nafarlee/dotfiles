return {{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        vim.treesitter.start()
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- Enable treesitter-based folds
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })
    require('nvim-treesitter').install({
      "python",
      "markdown",
      "bash",
      "javascript",
      "typescript",
      "scheme",
      "sql",
      "yaml",
      "toml",
      "fish",
      "lua",
      "clojure",
    })
  end,
}}
