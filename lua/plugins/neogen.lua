return {
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		-- uncomment next line if you want to follow only stable versions
		-- version = "*"
		--
		keys = { { "<leader>doc", ":Neogen<cr>", desc = "Comment code like jsDoc" } },
		opts = {
			languages = {
				lua = { template = { annotation_convention = "emmylua" } },
				python = { template = { annotation_convention = "reST" } },
				javascript = { template = { annotation_convention = "jsdoc" } },
				javascriptreact = { template = { annotation_convention = "jsdoc" } },
				typescript = { template = { annotation_convention = "jsdoc" } },
				typescriptreact = { template = { annotation_convention = "jsdoc" } },
			},
		},
	},
}
