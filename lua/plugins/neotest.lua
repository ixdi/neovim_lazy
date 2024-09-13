return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("neotest").setup({
				discovery = {
					enabled = true,
				},
				adapters = {
					adapters = {
						require("neotest-jest")({
							jestCommand = "npm test --",
							jestConfigFile = "jest.config.ts",
							env = { CI = true },
							cwd = function(path)
								return vim.fn.getcwd()
							end,
						}),
						require("neotest-python")({
							-- Extra arguments for nvim-dap configuration
							-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
							dap = { justMyCode = false },
							-- Command line arguments for runner
							-- Can also be a function to return dynamic values
							args = { "--log-level", "DEBUG" },
							-- Runner to use. Will use pytest if available by default.
							-- Can be a function to return dynamic value.
							runner = "pytest",
							-- Custom python path for the runner.
							-- Can be a string or a list of strings.
							-- Can also be a function to return dynamic value.
							-- If not provided, the path will be inferred by checking for
							-- virtual envs in the local directory and for Pipenev/Poetry configs
							python = "/home/scortes/miniconda3/bin/python",
							-- Returns if a given file path is a test file.
							-- NB: This function is called a lot so don't perform any heavy tasks within it.
							-- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
							-- instances for files containing a parametrize mark (default: false)
							pytest_discover_instances = false,
						}),
					},
				},
			})
		end,
		keys = {
			{
				vim.api.nvim_set_keymap(
					"n",
					"<leader>twr",
					"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
					{}
				),
			},
		},
	},
}
