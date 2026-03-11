-- Active indent guide and indent text objects. When you're browsing
-- code, this highlights the current level of indentation, and animates
-- the highlighting.
vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.indentscope", event = { "BufReadPre", "BufNewFile" } },
})

require("mini.indentscope").setup({
	-- symbol = "▏",
	symbol = "│",
	options = { try_as_border = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"alpha",
		"dashboard",
		"nvim-tree",
		"mason",
		"notify",
		"toggleterm",
		"lazyterm",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})
