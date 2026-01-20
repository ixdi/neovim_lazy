return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = false,
			},
		},
		keys = {
			{
				"<S-Enter>",
				function()
					require("noice").redirect(vim.fn.getcmdline())
				end,
				mode = "c",
				desc = "Redirect Cmdline",
			},
			{
				"<leader>nl",
				function()
					require("noice").cmd("last")
				end,
				desc = "Noice Last Message",
			},
			{
				"<leader>nh",
				function()
					require("noice").cmd("history")
				end,
				desc = "Noice History",
			},
			{
				"<leader>na",
				function()
					require("noice").cmd("all")
				end,
				desc = "Noice All",
			},
			{
				"<leader>nd",
				function()
					require("noice").cmd("dismiss")
				end,
				desc = "Dismiss All",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>nq",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 1500,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			render = "compact",
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		-- indent guides for Neovim
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local opts = {
				indent = { char = "│" },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
				},
				-- show_trailing_blankline_indent = false,
				scope = { enabled = false },
			}
			require("ibl").setup(opts)
		end,
	},
	{
		-- Active indent guide and indent text objects. When you're browsing
		-- code, this highlights the current level of indentation, and animates
		-- the highlighting.
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		-- lsp symbol navigation for lualine. This shows where
		-- in the code structure you are - within functions, classes,
		-- etc - in the statusline.
		"SmiteshP/nvim-navic",
		lazy = true,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				icons = require("config").icons.kinds,
			}
		end,
	}, -- icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {
			override = {},
			default = true,
			color_icons = true,
		},
	}, -- ui components
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup()
		end,
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
}
