return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local function key_shortcuts(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Vertical Split"))
				vim.keymap.set("n", "i", api.node.open.horizontal, opts("Horizontal Split"))
				vim.keymap.set("n", "<space>", api.node.open.edit, opts("Open"))
			end

			require("nvim-tree").setup({
				view = { adaptive_size = true },
				update_focused_file = {
					enable = true,
				},
				on_attach = key_shortcuts,
				filters = {
					dotfiles = false,
				},
				renderer = {
					decorators = {
						"Git",
						"Open",
						"Hidden",
						"Modified",
						"Bookmark",
						"Diagnostics",
						"Copied",
						"Cut",
					},
				},
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
						vim.cmd("quit")
					end
				end,
			})
		end,
		keys = {
			{ "ee", ":NvimTreeToggle<CR>", desc = "NeoTree toggle reveal", silent = true },
			{ ",f", ":NvimTreeFocus<CR>", desc = "NeoTree reveal", silent = true },
		},
	},
}
