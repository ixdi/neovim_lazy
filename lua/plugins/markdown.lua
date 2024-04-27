return {
	{
		-- NOTE: you must go to ~/.local/share/nvim/lazy/markdown-preview.nvim/
		-- then update the package.json @node/type to the right version of your system node
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && git checkout -- . && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		keys = {
			{
				"<leader>md",
				":MarkdownPreviewToggle<cr>",
				desc = "Markdown preview",
			},
		},
	},
}
