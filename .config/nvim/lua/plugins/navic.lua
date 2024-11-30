return {
  "SmiteshP/nvim-navic",
  dependencies = { "LunarVim/breadcrumbs.nvim" },
  config = function()
    require("breadcrumbs").setup()
    local icons = require("config.icons")
    require("nvim-navic").setup({
      icons = icons.kind,
      highlight = true,
      lsp = {
        auto_attach = true,
      },
      click = true,
      separator = " " .. icons.ui.ChevronRight .. " ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    })
  end,
}
