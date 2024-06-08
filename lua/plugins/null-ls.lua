return {
	{ "davidmh/cspell.nvim" },
	{ "nvimtools/none-ls-extras.nvim" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim", "nvim-lua/plenary.nvim", "davidmh/cspell.nvim" },
		config = function()
			local none_ls = require("null-ls")
			local formatting = none_ls.builtins.formatting
			local diagnostics = none_ls.builtins.diagnostics
			local code_actions = none_ls.builtins.code_actions
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local cspell = require("cspell")
			none_ls.setup({
				debug = false,
				sources = {
					-- code_actions.eslint_d, -- deprecated use eslint-language-server from none-ls-extras
					code_actions.gitsigns,
					-- code_actions.refactoring,
					-- code_actions.shellcheck,
					cspell.code_actions.with({
						filetypes = {
							"javascript",
							"python",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"html",
						},
					}),
					-- diagnostics.eslint_d, -- deprecated use eslint-language-server from none-ls-extras
					-- diagnostics.luacheck, -- use selene / available in gbprod/none-ls-luacheck.nvim
					--[[ diagnostics.markdownlint.with({
						enabled_filetypes = { "markdown", "md", "markdown.mdx" },
					}), ]]
					-- diagnostics.codespell,
					cspell.diagnostics.with({
						filetypes = {
							"javascript",
							"python",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"html",
						},
					}),
					-- diagnostics.commitlint,
					-- diagnostics.editorconfig_checker,
					-- diagnostics.hadolint,
					-- diagnostics.misspell,
					--[[ diagnostics.semgrep.with({
						method = none_ls.methods.DIAGNOSTICS_ON_SAVE,
					}), ]]
					diagnostics.write_good,
					-- formatting.autopep8, -- deprecated, use ruff lsp
					-- formatting.isort,
					-- formatting.black,
					-- formatting.fixjson, -- deprecated, use jsonls
					-- formatting.prettierd,
					-- formatting.ruff, -- deprecated, use ruff lsp
					formatting.stylua,
					formatting.yamlfmt,
					--[[ formatting.biome.with({
						args = {
							"check",
							"--apply-unsafe",
							"--formatter-enabled=true",
							"--organize-imports-enabled=true",
							"--skip-errors",
							"$FILENAME",
						},
					}), ]]
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

--[[ 
  deleted:    code_actions/eslint.lua        (use eslint-language-server / available in none-ls-extras.nvim)
	deleted:    code_actions/eslint_d.lua      (use eslint-language-server / available in none-ls-extras.nvim)
	deleted:    code_actions/ltrs.lua          (use ltex-ls)
	deleted:    code_actions/shellcheck.lua    (use bashls / available in gbprod/none-ls-shellcheck.nvim)
	deleted:    code_actions/xo.lua            (use eslint-language-server)
	deleted:    diagnostics/bandit.lua         (use ruff)
	deleted:    diagnostics/chktex.lua         (use texlab)
	deleted:    diagnostics/clang_check.lua    (use clangd)
	deleted:    diagnostics/cpplint.lua        (use clangd / available in none-ls-extras.nvim)
	deleted:    diagnostics/curlylint.lua
	deleted:    diagnostics/deno_lint.lua      (use deno lsp)
	deleted:    diagnostics/eslint.lua         (use eslint-language-server)
	deleted:    diagnostics/eslint_d.lua       (use eslint-language-server)
	deleted:    diagnostics/flake8.lua         (use ruff / available in none-ls-extras.nvim)
	deleted:    diagnostics/gospel.lua
	deleted:    diagnostics/jshint.lua         (use eslint-language-server)
	deleted:    diagnostics/jsonlint.lua       (use jsonls)
	deleted:    diagnostics/luacheck.lua       (use selene / available in gbprod/none-ls-luacheck.nvim)
	deleted:    diagnostics/misspell.lua
	deleted:    diagnostics/php.lua            (available in gbprod/none-ls-php.nvim)
	deleted:    diagnostics/protoc_gen_lint.lua (use buf)
	deleted:    diagnostics/puglint.lua
	deleted:    diagnostics/psalm.lua          (use psalm lsp / available in gbprod/none-ls-psalm.nvim)
	deleted:    diagnostics/puppet_lint.lua
	deleted:    diagnostics/pycodestyle.lua    (use ruff)
	deleted:    diagnostics/pydocstyle.lua     (use ruff)
	deleted:    diagnostics/pylama.lua         (use ruff)
	deleted:    diagnostics/pyproject_flake8.lua (use ruff)
	deleted:    diagnostics/ruff.lua           (use ruff lsp)
	deleted:    diagnostics/semistandardjs.lua (use eslint-language-server)
	deleted:    diagnostics/shellcheck.lua     (use bashls / available in gbprod/none-ls-shellcheck.nvim)
	deleted:    diagnostics/standardjs.lua     (use eslint-language-server)
	deleted:    diagnostics/standardrb.lua     (use standardrb lsp)
	deleted:    diagnostics/tsc.lua            (use tsserver)
	deleted:    diagnostics/typos.lua          (use typos-lsp)
	deleted:    diagnostics/vulture.lua        (use ruff)
	deleted:    diagnostics/xo.lua             (use eslint-language-server)
	deleted:    formatting/autoflake.lua       (use ruff)
	deleted:    formatting/autopep8.lua        (use ruff)
	deleted:    formatting/beautysh.lua        (use shfmt)
	deleted:    formatting/brittany.lua        (use haskell-language-server)
	deleted:    formatting/cabal_fmt.lua       (use haskell-language-server)
	deleted:    formatting/deno_fmt.lua        (use deno lsp)
	deleted:    formatting/docformatter.lua    (use ruff)
	deleted:    formatting/dprint.lua          (use dprint lsp)
	deleted:    formatting/dtsfmt.lua          (upstream is missing)
	deleted:    formatting/eslint.lua          (use eslint-language-server)
	deleted:    formatting/eslint_d.lua        (use eslint-language-server)
	deleted:    formatting/fixjson.lua         (use jsonls)
	deleted:    formatting/fourmolu.lua        (use haskell-language-server)
	deleted:    formatting/htmlbeautifier.lua  (use tidy)
	deleted:    formatting/jq.lua              (use jsonls)
	deleted:    formatting/json_tool.lua       (use jsonls)
	deleted:    formatting/jsonnetfmt.lua      (use jsonnet-language-server)
	deleted:    formatting/latexindent.lua     (use texlab / available in none-ls-extras.nvim)
	deleted:    formatting/lua_format.lua      (use stylua)
	deleted:    formatting/markdown_toc.lua    (use marksman)
	deleted:    formatting/perlimports.lua     (use PerlNavigator)
	deleted:    formatting/perltidy.lua        (use PerlNavigator)
	deleted:    formatting/puppet_lint.lua
	deleted:    formatting/pyflyby.lua         (use ruff)
	deleted:    formatting/reorder_python_imports.lua (use ruff, isort or usort)
	deleted:    formatting/ruff.lua            (use ruff lsp)
	deleted:    formatting/ruff_format.lua     (use ruff lsp)
	deleted:    formatting/rustfmt.lua         (use rust-analyzer)
	deleted:    formatting/semistandardjs.lua  (use eslint-language-server)
	deleted:    formatting/standardjs.lua      (use eslint-language-server)
	deleted:    formatting/standardrb.lua      (use standardrb lsp)
	deleted:    formatting/standardts.lua      (use eslint-language-server)
	deleted:    formatting/stylish_haskell.lua (use haskell-language-server)
	deleted:    formatting/taplo.lua           (use taplo lsp)
	deleted:    formatting/templ.lua           (use templ lsp)
	deleted:    formatting/terrafmt.lua
	deleted:    formatting/trim_newlines.lua   (use editorconfig)
	deleted:    formatting/trim_whitespace.lua (use editorconfig)
	deleted:    formatting/vfmt.lua            (use vls)
	deleted:    formatting/xmlformat.lua       (use lemminx)
	deleted:    formatting/xmllint.lua         (use lemminx)
	deleted:    formatting/xq.lua              (use lemminx)
	deleted:    formatting/yq.lua              (use yamlls)
	deleted:    formatting/zigfmt.lua          (use zls) 
]]
