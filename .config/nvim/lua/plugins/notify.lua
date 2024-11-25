return {
	{
		"rcarriga/nvim-notify",
		config = function()
			-- Configure nvim-notify
			local notify = require("notify")
			notify.setup({
				stages = "fade_in_slide_out", -- Animation style
				timeout = 3000, -- Default timeout for notifications (ms)
				background_colour = "#1e222a", -- Background color
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
				fps = 60, -- Frames per second
				render = "minimal", -- Style of rendering notifications
			})

			-- Override the default vim.notify function with nvim-notify
			vim.notify = notify

			-- Optional: Keymap to view notification history
			vim.keymap.set("n", "<leader>nh", notify.history, { desc = "Notification History" })
		end,
	},

	-- Optional: Integration for Lazy.nvim notifications
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
		config = function()
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
					bottom_search = true, -- Use a classic bottom cmdline for search
					command_palette = true, -- Position the cmdline and popupmenu together
					long_message_to_split = true, -- Show long messages in a split
					inc_rename = true, -- Enable input dialog for incremental renaming
				},
				notify = {
					enabled = true,
				},
			})
		end,
	},
}
