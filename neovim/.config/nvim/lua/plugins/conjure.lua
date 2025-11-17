return {{
  "Olical/conjure",
  ft = {"janet"},
  init = function()
    vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
    vim.g["conjure#client#scheme#stdio#command"] = "gxi"
    vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
    vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
  end,
}}
