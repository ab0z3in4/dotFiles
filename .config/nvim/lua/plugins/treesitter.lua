require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "javascript", "html", "css", "solidity" },
  ignore_install = { "" },
  sync_install = false,
  auto_install = true,
  autopairs = { enable = true },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  textobjects = {
    elect = {
      enable = true,
      lookahead = true,
    }
  }
}
