return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "bash", "python", "javascript", "html", "css" },
			sync_install = false,
			highlight = { enable = true },
			autopairs = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
		})
	end,
}
