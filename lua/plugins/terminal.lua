return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		keys = {
			{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
			{ "<leader>tl", "<cmd>ToggleTermSendCurrentLine <T_ID><cr>", desc = "Toggle Send Current Line" },
			{ "<leader>tv", "<cmd>ToggleTermSendVisualLines <T_ID><cr>", desc = "Toggle Send Visual Lines" },
		},
	},
}
