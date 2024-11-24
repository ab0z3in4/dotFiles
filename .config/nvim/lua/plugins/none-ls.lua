return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier.with({
						extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
					}),
					null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
          null_ls.builtins.formatting.isort,
					null_ls.builtins.diagnostics.pylint,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})
			vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { noremap = true, silent = true })
		end,
	},
}
