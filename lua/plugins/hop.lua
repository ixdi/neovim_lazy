return {
	{
		"smoka7/hop.nvim",
		version = "*", -- optional but strongly recommended
		opts = {},
		keys = {
			{ "<leader>h", ":HopPattern<cr>", desc = "Hop pattern" },
			{ "<leader>hw", ":HopWord<cr>", desc = "Hop word" },
			{ "<leader>h1", ":HopChar1<cr>", desc = "Hop char 1" },
			{ "<leader>h2", ":HopChar2<cr>", desc = "Hop char 2" },
			{ "<leader>hl", ":HopLine<cr>", desc = "Hop line" },
		},
	},
}
