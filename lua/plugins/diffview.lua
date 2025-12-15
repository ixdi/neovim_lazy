return {
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		keys = {
			{ "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
			{ "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
			{ "<leader>dvt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview Toggle Files" },
			{ "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview History Files" },
		},
	},
}
