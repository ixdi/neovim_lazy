return {
	-- which-key helps you remember key bindings by showing a popup
	-- with the active keybindings of the command you started typing.
	{ "echasnovski/mini.icons", version = false },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- Suggested Spec:
			mode = { "n", "v", "i" },
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			---@type false | "classic" | "modern" | "helix"
			preset = "modern",
			delay = function(ctx)
				return ctx.plugin and 0 or 200
			end,
			expand = 1, -- expand groups when <= n mappings
			spec = {
				{ "<leader><tab>", group = "tabs" },
				{ "<leader>bu", group = "buffer" },
				{ "<leader>co", group = "code" },
				{ ",fi", group = "file/find" },
				{ "<leader>fix", group = "diagnostics/quickfix" },
				{ "<leader>gh", group = "hunks" },
				{ "<leader>git", group = "git" },
				{ "<leader>qu", group = "quit/session" },
				{ "<leader>sr", group = "search" },
				{ ",ui", group = "ui" },
				{ "<leader>win", group = "windows" },
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "gz", group = "surround" },
			},
		},
		--[[ config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end, ]]
		--[[ keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		}, ]]
	},
}
