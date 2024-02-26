return {
	-- surr*ound_words             ysiw)           (surround_words)
	--   *make strings               ys$"            "make strings"
	--   [delete ar*ound me!]        ds]             delete around me!
	--   remove <b>HTML t*ags</b>    dst             remove HTML tags
	--   'change quot*es'            cs'"            "change quotes"
	--   <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
	--   delete(functi*on calls)     dsf             function calls
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "ys",
					normal_cur = "yss",
					normal_line = "yS",
					normal_cur_line = "ySS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end,
	},
}
