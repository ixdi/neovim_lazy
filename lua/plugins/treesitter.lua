vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "master" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c_sharp",
		"cmake",
		"comment",
		"css",
		"csv",
		"diff",
		"dockerfile",
		"git_config",
		"gitcommit",
		"gitignore",
		"glimmer",
		"graphql",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"latex",
		"lua",
		"markdown",
		"markdown_inline",
		"mermaid",
		"prisma",
		"python",
		"regex",
		"scss",
		"sql",
		"ssh_config",
		"terraform",
		"tmux",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"vue",
		"xml",
		"yaml",
	},
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Enter>", -- set to `false` to disable one of the mappings
			node_incremental = "<Enter>",
			scope_incremental = false,
			node_decremental = "<Backspace>",
		},
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Re-run treesitter setup after pack changes",
	group = vim.api.nvim_create_augroup("TreesitterPackChanged", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" then
			vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
			---@diagnostic disable-next-line: param-type-mismatch
			local ok = pcall(vim.cmd, "TSUpdate")
			if not ok then
				vim.notify("Failed to run TSUpdate after nvim-treesitter update", vim.log.levels.WARN)
			end
		end
	end,
})
