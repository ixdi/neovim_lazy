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
						jump_next = "<M-j>",
						jump_prev = "<M-k>",
						accept = "<M-CR>",
						refresh = "<M-r>",
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
						accept_word = "<M-w>",
						accept_line = "<M-l>",
						next = "<M-j>",
						prev = "<M-k>",
						dismiss = "<M-d>",
					},
				},
				filetypes = {
					javascript = true, -- allow specific filetype
					typescript = true, -- allow specific filetype
					typescriptreact = true, -- allow specific filetype
					python = true,
					gitcommit = true,
					markdown = true,
					["."] = false, -- disable for all other filetypes and ignore default `filetypes`
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
				copilot_no_tab_map = true,
			})
		end,
		keys = {
			{ "<leader>cp", "<Cmd>Copilot panel<cr>", desc = "Copilot panel" },
			{ "<M><cr>", "<Plug>(copilot-accept)" },
			{ "<M>w", "<Plug>(copilot-accept-word)" },
			{ "<M>l", "<Plug>(copilot-accept-line)" },
			{ "<M>s", "<Plug>(copilot-suggest)" },
			{ "<M>d", "<Plug>(copilot-dismiss)" },
			{ "<M>j", "<Plug>(copilot-next)" },
			{ "<M>k", "<Plug>(copilot-previous)" },
		},
	},
}
