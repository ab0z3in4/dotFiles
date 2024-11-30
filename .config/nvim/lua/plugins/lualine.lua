return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = { "diagnostics" },
        lualine_y = { "progress" },
        lualine_z = {},
      },
      extensions = { "quickfix", "man", "fugitive" },
    })
  end,
}
