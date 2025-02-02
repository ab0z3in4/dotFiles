local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
null_ls.setup({
  debug = true,
  sources = {
    formatting.prettier,
    formatting.black,
    null_ls.builtins.completion.spell,
  },
})
