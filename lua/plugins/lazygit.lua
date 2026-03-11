vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	-- optional for floating window border decoration
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.keymap.set("n", "<leader>g", ":LazyGit<cr>", { desc = "LazyGit" })
