return {
	{
		-- Formatting framework for Neovim
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "dprint" },
					typescript = { "dprint" },
					javascriptreact = { "dprint" },
					typescriptreact = { "dprint" },
					json = { "dprint" },
					html = { "html" },
					css = { "cssls" },
					scss = { "cssls" },
					-- markdown = { "prettierd" },
					yaml = { "prettierd" },
					lua = { "stylua" },
					graphql = { "prettierd" },
					python = { "black" },
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
			})
			--[[ vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			}) ]]
		end,
	},
}
