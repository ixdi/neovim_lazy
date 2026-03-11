-- Brief aside: **What is LSP?**
--
-- LSP is an initialism you've probably heard, but might not understand what it is.
--
-- LSP stands for Language Server Protocol. It's a protocol that helps editors
-- and language tooling communicate in a standardized fashion.
--
-- In general, you have a "server" which is some tool built to understand a particular
-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
-- processes that communicate with some "client" - in this case, Neovim!
--
-- LSP provides Neovim with features like:
--  - Go to definition
--  - Find references
--  - Autocompletion
--  - Symbol Search
--  - and more!
--
-- Thus, Language Servers are external tools that must be installed separately from
-- Neovim. This is where `mason` and related plugins come into play.
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`

-- Useful status updates for LSP.
-- vim.pack.add({
-- 	{ src = "https://github.com/j-hui/fidget.nvim" }
-- })
--
-- require("fidget").setup({
-- 		-- Options related to LSP progress subsystem
-- 		progress = {
-- 			poll_rate = 0, -- How and when to poll for progress messages
-- 			suppress_on_insert = false, -- Suppress new messages while in insert mode
-- 			ignore_done_already = false, -- Ignore new tasks that are already complete
-- 			ignore_empty_message = false, -- Ignore new tasks that don't contain a message
-- 			-- Clear notification group when LSP server detaches
-- 			clear_on_detach = function(client_id)
-- 				local client = vim.lsp.get_client_by_id(client_id)
-- 				return client and client.name or nil
-- 			end,
-- 			-- How to get a progress message's notification group key
-- 			notification_group = function(msg)
-- 				return msg.lsp_client.name
-- 			end,
-- 			ignore = {}, -- List of LSP servers to ignore
--
-- 			-- Options related to how LSP progress messages are displayed as notifications
-- 			display = {
-- 				render_limit = 16, -- How many LSP messages to show at once
-- 				done_ttl = 3, -- How long a message should persist after completion
-- 				done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
-- 				done_style = "Constant", -- Highlight group for completed LSP tasks
-- 				progress_ttl = math.huge, -- How long a message should persist when in progress
-- 				-- Icon shown when LSP progress tasks are in progress
-- 				progress_icon = { "dots" },
-- 				-- Highlight group for in-progress LSP tasks
-- 				progress_style = "WarningMsg",
-- 				group_style = "Title", -- Highlight group for group name (LSP server name)
-- 				icon_style = "Question", -- Highlight group for group icons
-- 				priority = 30, -- Ordering priority for LSP notification group
-- 				skip_history = true, -- Whether progress notifications should be omitted from history
-- 				-- How to format a progress annotation
-- 				format_annote = function(msg)
-- 					return msg.title
-- 				end,
-- 				-- How to format a progress notification group's name
-- 				format_group_name = function(group)
-- 					return tostring(group)
-- 				end,
-- 				overrides = { -- Override options from the default notification config
-- 					rust_analyzer = { name = "rust-analyzer" },
-- 				},
-- 			},
--
-- 			-- Options related to Neovim's built-in LSP client
-- 			lsp = {
-- 				progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
-- 				log_handler = false, -- Log `$/progress` handler invocations (for debugging)
-- 			},
-- 		},
--
-- 		-- Options related to notification subsystem
-- 		notification = {
-- 			poll_rate = 10, -- How frequently to update and render notifications
-- 			filter = vim.log.levels.INFO, -- Minimum notifications level
-- 			history_size = 128, -- Number of removed messages to retain in history
-- 			override_vim_notify = false, -- Automatically override vim.notify() with Fidget
-- 			-- Conditionally redirect notifications to another backend
-- 			redirect = function(msg, level, opts)
-- 				if opts and opts.on_open then
-- 					return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
-- 				end
-- 			end,
--
-- 			-- Options related to how notifications are rendered as text
-- 			view = {
-- 				stack_upwards = true, -- Display notification items from bottom to top
-- 				align = "message", -- Indent messages longer than a single line
-- 				reflow = false, -- Reflow (wrap) messages wider than notification window
-- 				icon_separator = " ", -- Separator between group name and icon
-- 				group_separator = "---", -- Separator between notification groups
-- 				-- Highlight group used for group separator
-- 				group_separator_hl = "Comment",
-- 				line_margin = 1, -- Spaces to pad both sides of each non-empty line
-- 				-- How to render notification messages
-- 				render_message = function(msg, cnt)
-- 					return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
-- 				end,
-- 			},
--
-- 			-- Options related to the notification window and buffer
-- 			window = {
-- 				normal_hl = "Comment", -- Base highlight group in the notification window
-- 				winblend = 100, -- Background color opacity in the notification window
-- 				border = "none", -- Border around the notification window
-- 				zindex = 45, -- Stacking priority of the notification window
-- 				max_width = 0, -- Maximum width of the notification window
-- 				max_height = 0, -- Maximum height of the notification window
-- 				x_padding = 1, -- Padding from right edge of window boundary
-- 				y_padding = 0, -- Padding from bottom edge of window boundary
-- 				align = "bottom", -- How to align the notification window
-- 				relative = "editor", -- What the notification window position is relative to
-- 				tabstop = 8, -- Width of each tab character in the notification window
-- 				avoid = { "NvimTree" }, -- Filetypes the notification window should avoid
-- 				-- e.g., { "aerial", "NvimTree", "neotest-summary" }
-- 			},
-- 		},
--
-- 		-- Options related to logging
-- 		logger = {
-- 			level = vim.log.levels.WARN, -- Minimum logging level
-- 			max_size = 10000, -- Maximum log file size, in KB
-- 			float_precision = 0.01, -- Limit the number of decimals displayed for floats
-- 			-- Where Fidget writes its logs to
-- 			path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
-- 		},
-- })
--
-- -- These GLOBAL keymaps are created unconditionally when Nvim starts:
-- -- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- -- "gri" is mapped to vim.lsp.buf.implementation()
-- -- "grn" is mapped to vim.lsp.buf.rename()
-- -- "grr" is mapped to vim.lsp.buf.references()
-- -- "grt" is mapped to vim.lsp.buf.type_definition()
-- -- "gO" is mapped to vim.lsp.buf.document_symbol()
-- -- CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
-- -- v_an and v_in fall back to vim.lsp.buf.selection_range() when buffer has no treesitter parser
--
-- --  This function gets run when an LSP attaches to a particular buffer.
-- --    That is to say, every time a new file is opened that is associated with
-- --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
-- --    function will be executed to configure the current buffer
--
-- -- Diagnostic Config
-- -- See :help vim.diagnostic.Opts
-- vim.diagnostic.config({
-- 	severity_sort = true,
-- 	float = { border = "rounded", source = "if_many" },
-- 	underline = { severity = vim.diagnostic.severity.ERROR },
-- 	signs = vim.g.have_nerd_font and {
-- 		text = {
-- 			[vim.diagnostic.severity.ERROR] = "󰅚 ",
-- 			[vim.diagnostic.severity.WARN] = "󰀪 ",
-- 			[vim.diagnostic.severity.INFO] = "󰋽 ",
-- 			[vim.diagnostic.severity.HINT] = "󰌶 ",
-- 		},
-- 	} or {},
-- 	virtual_text = {
-- 		source = "if_many",
-- 		spacing = 2,
-- 		format = function(diagnostic)
-- 			local diagnostic_message = {
-- 				[vim.diagnostic.severity.ERROR] = diagnostic.message,
-- 				[vim.diagnostic.severity.WARN] = diagnostic.message,
-- 				[vim.diagnostic.severity.INFO] = diagnostic.message,
-- 				[vim.diagnostic.severity.HINT] = diagnostic.message,
-- 			}
-- 			return diagnostic_message[diagnostic.severity]
-- 		end,
-- 	},
-- })

-- Main LSP Configuration
vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" }
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    automatic_enable = {
      "bashls",
      "biome",
      "cssls",
      "cucumber_language_server",
      "docker_compose_language_service",
      "dockerls",
      "dprint",
      "eslint",
      "html",
      "intelephense",
      "jsonls",
      "lua_ls",
      "markdown_oxide",
      "marksman",
      "pylsp",
      "ruff",
      "rust_analyzer",
      "stylelint_lsp",
      "stylua",
      "tailwindcss-language-server",
    }
})
-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
	-- "ansiblels",
	-- "autoflake",
	-- "bashls",
	-- "biome",
	-- "black",
	-- "commitlint",
	-- "cssls",
	-- "cspell",
	-- "cucumber_language_server",
	-- "docker_compose_language_service",
	-- "dockerls",
	-- "dprint",
	-- "editorconfig-checker",
	-- "eslint_d",
	-- "flake8",
	-- "html",
	-- "intelephense",
	-- "isort",
	-- "jinja_lsp",
	-- "jsonls",
	-- "lua_ls",
	-- "markdown_oxide",
	-- "marksman",
	-- "mypy",
	-- "prettierd",
	-- "pydocstyle",
	-- "pyflakes",
	-- "pylsp",
	-- "ruff",
	-- "rust_analyzer",
	-- "semgrep",
	-- "shellcheck",
	-- "stylelint_lsp",
	-- "stylua",
	-- "tailwindcss",
	-- "terraformls",
	-- "tinymist",
	-- "write-good",
	-- "yamlls",
	-- "yapf",
