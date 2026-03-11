-- search/replace in multiple files

vim.pack.add({
	{ src = "https://github.com/nvim-pack/nvim-spectre", cmd = "Spectre" },
})

require("spectre").setup({
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
})

vim.keymap.set("n", "<Space>fr", function()
	require("spectre").open()
end, { desc = "Replace in files (Spectre)" })
