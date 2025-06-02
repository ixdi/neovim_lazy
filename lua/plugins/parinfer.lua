return {
	{
		-- Parinfer automatically balances parentheses as you type when working
		"gpanders/nvim-parinfer",
		config = function()
			vim.g.parinfer_filetypes = {
				"dune",
				"scheme",
				"query",
				"racket",
			}
		end,
	},
}
