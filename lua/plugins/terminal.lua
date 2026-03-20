-- Modern terminal management plugin for Neovim
vim.pack.add({
	{ src = "https://github.com/waiting-for-dev/toggleterm.nvim", branch = "waiting-for-dev/wop" },
})

require("toggleterm").setup()

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Floating Terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
vim.keymap.set("n", "<leader>tl", "<cmd>ToggleTermSendCurrentLine <T_ID><cr>", { desc = "Toggle Send Current Line" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTermSendVisualLines <T_ID><cr>", { desc = "Toggle Send Visual Lines" })
