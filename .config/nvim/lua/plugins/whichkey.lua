return {
  "folke/which-key.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")
    which_key.setup({
      opts = {
        mode = "n",
        prefix = "<leader>",
      },
    })
    which_key.add({
      mode = { "n", "v" },
      {
        "<leader>q",
        "<cmd>q<cr>",
        desc = "Quit",
      },
      {
        "<leader>w",
        "<cmd>w<cr>",
        desc = "Write File",
      },
      {
        "<leader>t",
        "<cmd>tabnew | terminal<CR>",
        desc = "Terminal",
      },
      {
        "<leader>v",
        "<cmd>vsplit<CR>",
        desc = "Split Window",
      },
      { "<leader>l", group = "LSP" },
      {
        "<leader>la",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        desc = "Code Action",
        mode = "n",
      },
      {
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
        desc = "Format",
        mode = "n",
      },
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "Information",
        mode = "n",
      },
      {
        "<leader>lj",
        "<cmd>lua vim.diagnostic.goto_next()<cr>",
        desc = "Next Diagnostic",
        mode = "n",
      },
      {
        "<leader>lk",
        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
        desc = "Prev Diagnostic",
        mode = "n",
      },
      {
        "<leader>ll",
        "<cmd>lua vim.lsp.codelens.run()<cr>",
        desc = "CodeLens Action",
        mode = "n",
      },
      {
        "<leader>lq",
        "<cmd>lua vim.diagnostic.setloclist()<cr>",
        desc = "Quickfix",
        mode = "n",
      },
      { "<leader>f", group = "Buffers" },
      {
        "<leader>fv",
        "<cmd>Telescope buffers previewer=false<cr>",
        desc = "Find",
        mode = "n",
      },
      {
        "<leader>fb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Checkout Git Branch",
        mode = "n",
      },
      {
        "<leader>fc",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Colorscheme",
        mode = "n",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files",
        mode = "n",
      },
      {
        "<leader>ft",
        "<cmd>Telescope live_grep<cr>",
        desc = "Find Text",
        mode = "n",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help",
        mode = "n",
      },
      {
        "<leader>fl",
        "<cmd>Telescope resume<cr>",
        desc = "Last Search",
        mode = "n",
      },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent Files",
        mode = "n",
      },
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<CR>",
        desc = "Explorer",
        mode = "n",
      },
      {
        "<leader>/",
        "<Plug>(comment_toggle_linewise_current)",
        desc = "Comment",
        mode = "n",
      },
      {
        "<leader>/",
        "<Plug>(comment_toggle_linewise_visual)",
        desc = "Comment",
        mode = "v",
      },
    })
  end,
}
