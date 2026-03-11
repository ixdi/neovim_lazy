-- Comment code like jsDoc

vim.pack.add({
	{ src = "https://github.com/danymat/neogen" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("neogen").setup({
	languages = {
		lua = { template = { annotation_convention = "emmylua" } },
		sh = { template = { annotation_convention = "google_bash" } },
		python = { template = { annotation_convention = "google_docstrings" } },
		javascript = { template = { annotation_convention = "jsdoc" } },
		javascriptreact = { template = { annotation_convention = "jsdoc" } },
		typescript = { template = { annotation_convention = "jsdoc" } },
		typescriptreact = { template = { annotation_convention = "jsdoc" } },
	},
})

vim.keymap.set("n", "<leader>cd", ":Neogen<cr>", { desc = "Comment code like jsDoc" })
