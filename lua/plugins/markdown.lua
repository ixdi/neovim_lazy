-- NOTE: you must go to ~/.local/share/nvim/lazy/markdown-preview.nvim/
-- then update the package.json @node/type to the right version of your system node

vim.pack.add({
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

require("live-preview").setup()

vim.keymap.set("n", "<leader>md", ":LivePreview start<cr>", { desc = "Markdown preview" })

-- render-markdown.nvim is a plugin that uses treesitter to render markdown in a floating window

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
	enabled = true,
	latex = {
		enabled = false,
	},
	anti_conceal = {
		-- This enables hiding added text on the line the cursor is on.
		enabled = true,
		-- Modes to disable anti conceal feature.
		disabled_modes = true,
		-- Number of lines above cursor to show.
		above = 0,
		-- Number of lines below cursor to show.
		below = 0,
		-- Which elements to always show, ignoring anti conceal behavior. Values can either be
		-- booleans to fix the behavior or string lists representing modes where anti conceal
		-- behavior will be ignored. Valid values are:
		--   bullet
		--   callout
		--   check_icon, check_scope
		--   code_background, code_border, code_language
		--   dash
		--   head_background, head_border, head_icon
		--   indent
		--   latex
		--   link
		--   quote
		--   sign
		--   table_border
		--   virtual_lines
		ignore = {
			code_background = true,
			indent = true,
			sign = true,
			virtual_lines = true,
		},
	},
	completions = {
		blink = { enabled = true },
		lsp = { enabled = true },
	},
}) -- only mandatory if you want to set custom options

vim.keymap.set("n", "<leader>mv", function()
	require("render-markdown").toggle()
end, { desc = "Markdown preview" })
