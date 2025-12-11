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
				vim.keymap.set("n", "R", api.tree.reload, opts("Reload"))
			end

			local icons = require("config").icons

			require("nvim-tree").setup({
				view = { adaptive_size = true },
				update_focused_file = {
					enable = true,
				},
				on_attach = key_shortcuts,
				auto_reload_on_write = true,
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
					full_name = true,
					group_empty = true,
					special_files = {},
					symlink_destination = false,
					indent_markers = {
						enable = true,
					},
					icons = {
						git_placement = "signcolumn",
						diagnostics_placement = "right_align",
						web_devicons = {
							file = {
								enable = true,
								color = true,
							},
							folder = {
								enable = true,
								color = true,
							},
						},
						show = {
							file = true,
							folder = false,
							folder_arrow = false,
							git = true,
							diagnostics = true,
						},
						glyphs = {
							git = {
								unstaged = icons.git.Unstaged,
								staged = icons.git.Staged,
								unmerged = icons.git.Unmerged,
								renamed = icons.git.Renamed,
								untracked = icons.git.Untracked,
								deleted = icons.git.Deleted,
								ignored = icons.git.Ignored,
							},
						},
					},
				},
				git = {
					enable = true,
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = {
						hint = icons.diagnostics.Hint,
						info = icons.diagnostics.Info,
						warning = icons.diagnostics.Warning,
						error = icons.diagnostics.Error,
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
