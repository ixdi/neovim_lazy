return {
	{
		-- Refactor code with Telescope
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					c = false,
					cpp = true,
					cxx = false,
					go = false,
					h = false,
					hpp = false,
					java = false,
					js = true,
					ts = true,
					py = true,
				},
				prompt_func_param_type = {
					c = false,
					cpp = true,
					cxx = false,
					go = false,
					h = false,
					hpp = false,
					java = false,
					js = true,
					ts = true,
					py = true,
				},
				printf_statements = {},
				print_var_statements = {},
			})
			-- load refactoring Telescope extension
			require("telescope").load_extension("refactoring")
			vim.keymap.set({ "n", "x" }, "<leader>rr", function()
				require("telescope").extensions.refactoring.refactors()
			end)
			-- Automated insertion of print statement to mark the calling of a function
			vim.keymap.set("n", "<leader>rp", function()
				require("refactoring").debug.printf({ below = false })
			end)
			-- Print variables
			vim.keymap.set({ "x", "n" }, "<leader>rv", function()
				require("refactoring").debug.print_var()
			end)
			-- Cleanup prints
			vim.keymap.set("n", "<leader>rc", function()
				require("refactoring").debug.cleanup({})
			end)
		end,
	},
}
