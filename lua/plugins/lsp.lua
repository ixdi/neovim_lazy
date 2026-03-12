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

--Default keymaps
-- keymap.set("n", "gf", vim.lsp.buf.references, opts) -- show definition, references
-- keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- got to declaration
-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
-- keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
-- keymap.set("n", "gs", vim.lsp.buf.signature_help, opts) -- show signature help
-- -- keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show signature help
-- keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename
-- keymap.set("n", "[d", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<CR>", opts) -- jump to previous diagnostic in buffer
-- keymap.set("n", "]d", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<CR>", opts) -- jump to next diagnostic in buffer
-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

-- Main LSP Configuration
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

local icons_default = require("config.defaults").icons

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons_default.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = icons_default.diagnostics.Warn,
			[vim.diagnostic.severity.INFO] = icons_default.diagnostics.Info,
			[vim.diagnostic.severity.HINT] = icons_default.diagnostics.Hint,
		},
		texthl = {
			[vim.diagnostic.severity.ERROR] = "Error",
			[vim.diagnostic.severity.WARN] = "Error",
			[vim.diagnostic.severity.HINT] = "Hint",
			[vim.diagnostic.severity.INFO] = "Info",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
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
	},
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
