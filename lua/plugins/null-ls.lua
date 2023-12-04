return {
	{ "davidmh/cspell.nvim" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "davidmh/cspell.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local cspell = require("cspell")
			null_ls.setup({
				debug = false,
				sources = {
					code_actions.eslint_d.with({
						disabled_filetypes = { "typescript" },
					}),
					code_actions.gitsigns,
					code_actions.refactoring,
					code_actions.shellcheck,
					cspell.code_actions,
					diagnostics.eslint_d.with({ disabled_filetypes = { "typescript" } }),
					diagnostics.luacheck,
					diagnostics.markdownlint,
					diagnostics.codespell,
					cspell.diagnostics.with({
						disabled_filetypes = { "lua" },
					}),
					diagnostics.commitlint,
					diagnostics.editorconfig_checker,
					diagnostics.hadolint,
					diagnostics.misspell,
					--[[ diagnostics.semgrep.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					}), ]]
					diagnostics.write_good,
					-- formatting.autopep8,
					formatting.isort,
					formatting.black,
					formatting.stylua,
					formatting.fixjson,
					formatting.prettierd.with({
						disabled_filetypes = { "html" },
					}),
					formatting.yamlfmt,
				},
				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									filter = function(_client)
										return _client.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			})
		end,
	},
}
