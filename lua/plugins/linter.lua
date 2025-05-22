return {
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				markdown = { "vale" },
				python = { "ruff", "pylint" },
				lua = { "luacheck" },
				sh = { "shellcheck" },
				terraform = { "tflint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.py", "*.sh", "*.lua" },
				callback = function()
					require("lint").try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>li", function()
				require("lint").try_lint()
			end, { desc = "Lint current buffer" })
		end,
	},
}
