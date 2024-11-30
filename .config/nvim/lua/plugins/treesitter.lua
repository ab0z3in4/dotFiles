return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "javascript", "html", "css" },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
