return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local servers = {
      "lua_ls",
      "cssls",
      "html",
      -- "vtsls",
      "ts_ls",
      "solidity_ls",
      "pyright",
      "bashls",
      "jsonls",
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
    require("mason-lspconfig").setup {
      ensure_installed = servers,
    }
  end
}
