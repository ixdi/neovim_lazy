return {
	-- search/replace in multiple files
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = {
			open_cmd = "noswapfile vnew",
			color_devicons = true,
			live_update = false,
			line_sep_start = "┌-----------------------------------------",
			result_padding = "¦  ",
			line_sep = "└-----------------------------------------",
			highlight = {
				ui = "String",
				search = "DiffChange",
				replace = "DiffDelete",
			},
		},
        -- stylua: ignore
        keys = {
            {
                "<leader>fr",
                function() require("spectre").open() end,
                desc = "Replace in files (Spectre)"
            }
        }
,
	},
}
