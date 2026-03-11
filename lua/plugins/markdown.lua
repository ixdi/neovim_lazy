-- NOTE: you must go to ~/.local/share/nvim/lazy/markdown-preview.nvim/
-- then update the package.json @node/type to the right version of your system node

vim.pack.add({
	{ src = "https://github.com/iamcco/markdown-preview.nvim", build = "cd app && git checkout -- . && yarn install" },
})

vim.g.mkdp_filetypes = { "markdown" }

vim.keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<cr>", { desc = "Markdown preview" })
