-- Git related plugins
return {
	{
		"akinsho/git-conflict.nvim",
		commit = "2957f74",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("git-conflict").setup({
				default_mappings = {
					ours = "co",
					theirs = "ct",
					none = "c0",
					both = "cb",
					next = "cn",
					prev = "cp",
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			local map = require("helpers.keys").map
			map("n", "<leader>ga", "<cmd>Git add %<cr>", "Stage the current file")
			map("n", "<leader>gb", "<cmd>Git blame<cr>", "Show the blame")
		end,
	},
}
