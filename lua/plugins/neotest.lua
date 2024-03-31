return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest")({
						---Custom criteria for a file path to determine if it is a vitest test file.
						---@async
						---@param file_path string Path of the potential vitest test file
						---@return boolean
						is_test_file = function(file_path)
							-- Check if the file path includes something else
							if string.match(file_path, ".test.") then
								return true
							elseif string.match(file_path, ".spec.") then
								return true
							end
							return false
						end,
						-- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
						filter_dir = function(name, rel_path, root)
							if rel_path:match("src/test/") then
								return true
							else
								return name ~= "node_modules"
							end
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
						pytest_discover_instances = true,
					}),
				},
			})
		end,
	},
}
