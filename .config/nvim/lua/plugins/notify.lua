local notify = require("notify")
notify.setup({
  stages = "fade_in_slide_out",
  timeout = 3000,
  background_colour = "#1e222a",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
  fps = 60,
  render = "compact",
})
vim.notify = notify
require("noice").setup({
  lsp = {
    progress = {
      enabled = true,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
  },
  notify = {
    enabled = true,
  },
})
