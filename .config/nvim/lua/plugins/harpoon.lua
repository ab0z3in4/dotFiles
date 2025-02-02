local function mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end
local keymap = vim.keymap.set
local harpoon = require("harpoon")
local opts = { noremap = true, silent = true }
 keymap("n", "<C-b>", mark_file, opts)
keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_create_autocmd({ "filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.cmd [[highlight link HarpoonBorder TelescopeBorder]]
  end,
})
