return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<C-fb>", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<C-fh>", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
