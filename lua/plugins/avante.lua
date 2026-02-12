return {
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- this file can contain specific instructions for your project
			instructions_file = "avante.md",
			-- for example
			provider = "gemini-cli",
			mode = "agentic",
			auto_suggestions_provider = "gemini",
			acp_providers = {
				["gemini-cli"] = {
					command = "gemini",
					args = { "--experimental-acp" },
					env = {
						NODE_NO_WARNINGS = "1",
						GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
					},
				},
			},
			behaviour = {
				auto_suggestions = false, -- Experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = false,
				minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
				enable_token_counting = true, -- Whether to enable token counting. Default to true.
				auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat. Default to true.
				auto_approve_tool_permissions = true, -- Default: auto-approve all tools (no prompts)
				-- Examples:
				-- auto_approve_tool_permissions = false,                -- Show permission prompts for all tools
				-- auto_approve_tool_permissions = {"bash", "str_replace"}, -- Auto-approve specific tools only
				---@type "popup" | "inline_buttons"
				confirmation_ui_style = "inline_buttons",
				--- Whether to automatically open files and navigate to lines when ACP agent makes edits
				---@type boolean
				acp_follow_agent_locations = true,
			},
			prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
				enabled = true, -- toggle logging entirely
				log_dir = vim.fn.stdpath("cache") .. "/avante_prompts", -- directory where logs are saved
				fortune_cookie_on_success = false, -- shows a random fortune after each logged prompt (requires `fortune` installed)
				next_prompt = {
					normal = "<C-n>", -- load the next (newer) prompt log in normal mode
					insert = "<C-n>",
				},
				prev_prompt = {
					normal = "<C-p>", -- load the previous (older) prompt log in normal mode
					insert = "<C-p>",
				},
			},
			mappings = {
				--- @class AvanteConflictMappings
				diff = {
					ours = "co",
					theirs = "ct",
					all_theirs = "ca",
					both = "cb",
					cursor = "cc",
					next = "]x",
					prev = "[x",
				},
				suggestion = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
				jump = {
					next = "]]",
					prev = "[[",
				},
				submit = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				cancel = {
					normal = { "<C-c>", "<Esc>", "q" },
					insert = { "<C-c>" },
				},
				sidebar = {
					apply_all = "A",
					apply_cursor = "a",
					retry_user_request = "r",
					edit_user_request = "e",
					switch_windows = "<Tab>",
					reverse_switch_windows = "<S-Tab>",
					remove_file = "d",
					add_file = "@",
					close = { "<Esc>", "q" },
					close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
				},
			},
			selection = {
				enabled = true,
				hint_display = "delayed",
			},
			windows = {
				---@type "right" | "left" | "top" | "bottom"
				position = "right", -- the position of the sidebar
				wrap = true, -- similar to vim.o.wrap
				width = 30, -- default % based on available width
				sidebar_header = {
					enabled = true, -- true, false to enable/disable the header
					align = "center", -- left, center, right for title
					rounded = true,
				},
				spinner = {
					editing = {
						"⡀",
						"⠄",
						"⠂",
						"⠁",
						"⠈",
						"⠐",
						"⠠",
						"⢀",
						"⣀",
						"⢄",
						"⢂",
						"⢁",
						"⢈",
						"⢐",
						"⢠",
						"⣠",
						"⢤",
						"⢢",
						"⢡",
						"⢨",
						"⢰",
						"⣰",
						"⢴",
						"⢲",
						"⢱",
						"⢸",
						"⣸",
						"⢼",
						"⢺",
						"⢹",
						"⣹",
						"⢽",
						"⢻",
						"⣻",
						"⢿",
						"⣿",
					},
					generating = { "·", "✢", "✳", "∗", "✻", "✽" }, -- Spinner characters for the 'generating' state
					thinking = { "🤯", "🙄" }, -- Spinner characters for the 'thinking' state
				},
				input = {
					prefix = "> ",
					height = 8, -- Height of the input window in vertical layout
				},
				edit = {
					border = "rounded",
					start_insert = true, -- Start insert mode when opening the edit window
				},
				ask = {
					floating = false, -- Open the 'AvanteAsk' prompt in a floating window
					start_insert = true, -- Start insert mode when opening the ask window
					border = "rounded",
					---@type "ours" | "theirs"
					focus_on_apply = "ours", -- which diff to focus after applying
				},
			},
			highlights = {
				---@type AvanteConflictHighlights
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},
			--- @class AvanteConflictUserConfig
			diff = {
				autojump = true,
				---@type string | fun(): any
				list_opener = "copen",
				--- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
				--- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
				--- Disable by setting to -1.
				override_timeoutlen = 500,
			},
			suggestion = {
				debounce = 600,
				throttle = 600,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
