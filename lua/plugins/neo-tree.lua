return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
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
				-- pass to setup along with your other options
				on_attach = key_shortcuts,
			})
		end,
		keys = {
			{ "ee", ":NvimTreeToggle<CR>", desc = "NeoTree toggle reveal", silent = true },
			{ ",f", ":NvimTreeFocus<CR>", desc = "NeoTree reveal", silent = true },
		},
	},
	-- {
	-- file explorer
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	lazy = false,
	-- 	keys = {
	-- 		{ "ee", ":Neotree toggle reveal<CR>", desc = "NeoTree toggle reveal", silent = true },
	-- 		{ "eb", ":Neotree buffers<CR>", desc = "NeoTree buffers", silent = true },
	-- 		{ "es", ":Neotree document_symbols<CR>", desc = "NeoTree document_symbols", silent = true },
	-- 		{ "eg", ":Neotree git_status<CR>", desc = "NeoTree git_status", silent = true },
	-- 		{ ",f", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	-- 	},
	-- 	--		deactivate = function()
	-- 	--			vim.cmd([[Neotree close]])
	-- 	--		end,
	-- 	--		init = function()
	-- 	--			if vim.fn.argc() == 1 then
	-- 	--				local stat = vim.loop.fs_stat(vim.fn.argv(0))
	-- 	--				if stat and stat.type == "directory" then
	-- 	--					require("neo-tree")
	-- 	--				end
	-- 	--			end
	-- 	--		end,
	-- 	opts = {
	-- 		source_selector = { winbar = true, statusline = false },
	-- 		sources = {
	-- 			"filesystem",
	-- 			"buffers",
	-- 			"document_symbols",
	-- 			"git_status",
	-- 		},
	-- 		open_files_do_not_replace_types = {
	-- 			"terminal",
	-- 			"qf",
	-- 			"Outline",
	-- 		},
	-- 		filesystem = {
	-- 			bind_to_cwd = false,
	-- 			follow_current_file = { enabled = true },
	-- 			use_libuv_file_watcher = true,
	-- 		},
	-- 		window = {
	-- 			mappings = {
	-- 				["<space>"] = "toggle_node",
	-- 				["o"] = "open",
	-- 				["s"] = "open_split",
	-- 				["v"] = "open_vsplit",
	-- 				["?"] = {
	-- 					"show_help",
	-- 					nowait = false,
	-- 					config = { title = "Order by", prefix_key = "o" },
	-- 				},
	-- 			},
	-- 		},
	-- 		default_component_configs = {
	-- 			indent = {
	-- 				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
	-- 				expander_collapsed = "",
	-- 				expander_expanded = "",
	-- 				expander_highlight = "NeoTreeExpander",
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("neo-tree").setup(opts)
	-- 		vim.api.nvim_create_autocmd("TermClose", {
	-- 			pattern = "*lazygit",
	-- 			callback = function()
	-- 				if package.loaded["neo-tree.sources.git_status"] then
	-- 					require("neo-tree.sources.git_status").refresh()
	-- 				end
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
