return {
	{
		"ggandor/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap)")
			vim.keymap.set("n", "F", "<Plug>(leap-from-window)")
			require("leap").opts.case_sensitive = true
		end,
	},
}
