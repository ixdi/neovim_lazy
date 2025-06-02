return {
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	--[[ {
		"laytan/tailwind-sorter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
		build = "cd formatter && npm i && npm run build",
		config = true,
		opts = {
			on_save_enabled = true, -- If `true`, automatically enables on save sorting.
			on_save_pattern = { "*.js", "*.tsx" }, -- The file patterns to watch and sort.
			node_path = "node",
			trim_spaces = true,
		},
	}, ]]
}
