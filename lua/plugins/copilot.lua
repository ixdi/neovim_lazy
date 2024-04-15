return {
	{ "AndreM222/copilot-lualine" },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "<M-j>",
						jump_next = "<M-k>",
						accept = "<M-CR>",
						refresh = "gr",
						open = "<M-o>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 150,
					keymap = {
						accept = "<M-CR>",
						accept_word = false,
						accept_line = false,
						next = "<M-j>",
						prev = "<M-k>",
						dismiss = "<M-d>",
					},
				},
				filetypes = {
					javascript = true, -- allow specific filetype
					typescript = true, -- allow specific filetype
					typescriptreact = true, -- allow specific filetype
					gitcommit = true,
					markdown = true,
					["."] = false, -- disable for all other filetypes and ignore default `filetypes`
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
		keys = {
			{ "<leader>cp", "<Cmd>Copilot panel<cr>", desc = "Copilot panel" },
		},
	},
}
