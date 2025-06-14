-- Fancier statusline
return {
	{
		-- statusline
		"nvim-lualine/lualine.nvim",
		dependencies = { "AndreM222/copilot-lualine" },
		event = "VeryLazy",
		opts = function()
			local icons = require("config").icons

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					icons_enabled = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"copilot",
						},
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = { left = 1, right = 0 },
						},
						{
							"filename",
							path = 1,
							symbols = {
								modified = "  ",
								readonly = "",
								unnamed = "",
							},
						}, -- stylua: ignore
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = {
            -- stylua: ignore
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and
                    require("noice").api.status.command
                    .has()
              end
            }, -- stylua: ignore
						{
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.mode.has()
							end,
						}, -- stylua: ignore
						{
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
						{ "spaces" },
						{ "encoding" },
						{ "filetype" },
					},
					lualine_y = {
						{
							"progress",
							separator = " ",
							padding = { left = 1, right = 0 },
						},
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},
}
