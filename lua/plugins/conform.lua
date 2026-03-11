-- Formatting framework for Neovim

vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } }
})

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
		lua = { "lua_ls" },
		graphql = { "prettierd" },
		python = { "black" },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
