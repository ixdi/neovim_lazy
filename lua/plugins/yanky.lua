vim.g.clipboard = {
	-- name = "xsel_override",
	-- copy = {
	-- 	["+"] = "xsel --input --clipboard",
	-- 	["*"] = "xsel --input --primary",
	-- },
	-- paste = {
	-- 	["+"] = "xsel --output --clipboard",
	-- 	["*"] = "xsel --output --primary",
	-- },
	name = "wl-clipboard (wsl)",
	copy = {
		["+"] = "wl-copy --foreground --type text/plain",
		["*"] = "wl-copy --foreground --primary --type text/plain",
	},
	paste = {
		["+"] = "wl-paste",
		["*"] = "wl-paste --primary",
	},
	cache_enabled = 1,
}

-- Yanky.nvim keymaps
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfterCharwise)", { desc = "Yanky: Put After Charwise" })
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBeforeCharwise)", { desc = "Yanky: Put Before Charwise" })

vim.keymap.set("n", "<m-p>", "<Plug>(YankyPreviousEntry)", { desc = "Yanky: Previous Yank Entry" })
vim.keymap.set("n", "<m-n>", "<Plug>(YankyNextEntry)", { desc = "Yanky: Next Yank Entry" })

-- New line put and reindent
vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)", { desc = "Yanky: Put After with Reindent" })
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)", { desc = "Yanky: Put Before with Reindent" })

-- Clear yank history
vim.keymap.set("n", "<leader>yc", ":YankyClearHistory <cr>", { desc = "Clear Yank History" })

-- Yanky.nvim Telescope extension keymap
vim.keymap.set("n", "<leader>p", function()
	require("telescope").extensions.yank_history.yank_history()
end, { desc = "Open Yank History" })

-- Preserve cursor position while yanking
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")

return {
	{
		-- Yanky.nvim: A Neovim plugin for managing yank history
		"gbprod/yanky.nvim",
		opts = {
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
				update_register_on_cycle = false,
				permanent_wrapper = nil,
			},
			picker = {
				select = {
					action = nil, -- nil to use default put action
				},
				telescope = {
					mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
				},
			},
			system_clipboard = {
				sync_with_ring = true,
				clipboard_register = nil,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 500,
			},
			preserve_cursor_position = {
				enabled = true,
			},
			textobj = {
				enabled = false,
			},
		},
	},
}
