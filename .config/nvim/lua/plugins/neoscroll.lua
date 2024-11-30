return {
  "karb94/neoscroll.nvim",
  config = function()
    vim.cmd([[
      nnoremap <C-j> <C-D>
      vnoremap <C-j> <C-D>
      nnoremap <C-k> <C-U>
      vnoremap <C-k> <C-U>
    ]])
    require("neoscroll").setup({
      mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      duration_multiplier = 1.0,
      easing_function = nil,
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,
    })
    local neoscroll = require("neoscroll")
    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 250 })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 250 })
      end,
      ["<C-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<C-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
