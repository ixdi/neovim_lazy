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
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    config = function()
      require("neotest").setup({
        discovery = {
          enabled = true,
        },
        adapters = {
          require("neotest-vitest"),
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
              is_test_file = function(file_path)
                -- By default, only returns true if a file contains one of several rule
                -- extension patterns. See default implementation here: https://github.com/thenbe/neotest-playwright/blob/53c7c9ad8724a6ee7d708c1224f9ea25fa071b61/src/discover.ts#L25-L47
                local result = file_path:find("e2e-tests/.*%.spec%.ts$") ~= nil
                return result
              end,
            },
          }),
          --[[ require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}), ]]
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
      })
    end,
    keys = {
      {
        "<leader>tvr",
        "<cmd>lua require('neotest').run.run({ vitestCommand = 'pnpm test' })<cr>",
        desc = "Run Watch Vitest",
      },
      {
        "<leader>tvf",
        "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'pnpm test' })<cr>",
        desc = "Run Watch Vitest File",
      },
      {
        "<leader>tpr",
        "<cmd>lua require('neotest').run.run({ playwrightCommand = 'pnpm test:e2e' })<cr>",
        desc = "Run Watch Playwright",
      },
      {
        "<leader>tpf",
        "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), playwrightCommand = 'pnpm test:e2e' })<cr>",
        desc = "Run Watch Playwright File",
      },
    },
  },
}
