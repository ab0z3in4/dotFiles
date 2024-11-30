return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local harpoon = require("harpoon")
    harpoon:setup()
    keymap("n", "<C-b>", function()
      harpoon:list():add()
      vim.notify("󱡅  marked file")
    end, opts)
    keymap("n", "<TAB>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, opts)
  end,
}
