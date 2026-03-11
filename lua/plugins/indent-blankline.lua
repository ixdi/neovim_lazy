-- show indent lines
vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", main = "ibl" },
})

require("ibl").setup({
	indent = { char = "│" },
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"nvim-tree",
			"mason",
			"notify",
			"toggleterm",
		},
	},
	scope = { enabled = false },
})
