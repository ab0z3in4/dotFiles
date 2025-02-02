local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "pyright",
  "bashls",
  "solidity_ls_nomicfoundation",
}
require("mason").setup {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    }
  },
}
require("mason-lspconfig").setup { ensure_installed = servers }
