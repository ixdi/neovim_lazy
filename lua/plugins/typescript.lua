-- Better TypeScript descriptions for Neovim

vim.pack.add({
	{
		src = "https://github.com/dmmulroy/ts-error-translator.nvim",
	},
})

require("ts-error-translator").setup()
