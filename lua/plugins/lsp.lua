-- LSP Configuration & Plugins
return {
	{
		-- Set up Mason before anything else
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				providers = {
					"mason.providers.registry-api",
					"mason.providers.client",
				},
				ui = {
					check_outdated_packages_on_open = true,
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
			"RRethy/vim-illuminate",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Neodev setup before LSP config
			require("neodev").setup({
				{
					library = {
						enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
						-- these settings will be used for your Neovim config directory
						runtime = true, -- runtime path
						types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
						-- plugins = true, -- installed opt or start plugins in packpath
						-- you can also specify the list of plugins to make available as a workspace library
						plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim", "neotest" },
					},
					setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
					-- for your Neovim config directory, the config.library settings will be used as is
					-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
					-- for any other directory, config.library.enabled will be set to false
					override = function(root_dir, options) end,
					-- With lspconfig, Neodev will automatically setup your lua-language-server
					-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
					-- in your lsp start options
					lspconfig = true,
					-- much faster, but needs a recent built of lua-language-server
					-- needs lua-language-server >= 3.6.0
					pathStrict = true,
				},
			})

			-- Turn on LSP status information
			require("fidget").setup({
				text = {
					spinner = "pipe", -- animation shown when tasks are ongoing
					done = "🗸", -- character shown when all tasks are complete
					commenced = "Started", -- message shown when task starts
					completed = "Completed", -- message shown when task completes
				},
			})

			local icons = require("config").icons.diagnostics
			-- Set up cool signs for diagnostics
			local signs = {
				Error = icons.Error,
				Warn = icons.Warn,
				Hint = icons.Hint,
				Info = icons.Info,
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Diagnostic config
			local config = {
				virtual_text = false,
				signs = { active = signs },
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)

			-- This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(client, bufnr)
				local lsp_map = require("helpers.keys").lsp_map

				-- Attach and configure vim-illuminate
				require("illuminate").on_attach(client)

				vim.api.nvim_create_autocmd("BufWritePre", {
					pattern = "<buffer>",
					-- Trim trailing whitespaces
					callback = function()
						-- Save cursor position to restore later
						local curpos = vim.api.nvim_win_get_cursor(0)
						-- Search and replace trailing whitespaces
						vim.cmd([[keeppatterns %s/\s\+$//e]])
						vim.api.nvim_win_set_cursor(0, curpos)
					end,
				})
				if client.server_capabilities.documentSymbolProvider then
					local navic = require("nvim-navic")
					navic.attach(client, bufnr)
				end
			end

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			-- local capabilities =
			-- require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			vim.lsp.config("*", {
				-- capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("ruff")
			vim.lsp.enable("eslint")
			vim.lsp.enable("tsserver")
			vim.lsp.enable("stylelint_lsp")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("yamlls")
			vim.lsp.enable("dockerls")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("cucumber_language_server")
			vim.lsp.enable("intelephense")
			vim.lsp.enable("marksman")
			vim.lsp.enable("html")
			vim.lsp.enable("biome")
			vim.lsp.enable("pyright")
		end,
	},
}
