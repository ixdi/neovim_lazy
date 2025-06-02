return {
	{
		-- Better TypeScript descriptions for Neovim
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup()
		end,
	},
}
