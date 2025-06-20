return {
	{
		-- See current buffers at the top of the editor
		-- tabs, which include filetype icons and close buttons.
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
			{
				"<leader>bP",
				"<Cmd>BufferLineGroupClose ungrouped<cr>",
				desc = "Delete non-pinned buffers",
			},
		},
		opts = {
			options = {
        -- stylua: ignore
        close_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        -- stylua: ignore
        right_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("config").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				separator_style = "thin",
			},
		},
	},
	{
		-- buffer remove
		"echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer"
      }, {
      "<leader>bD",
      function()
        require("mini.bufremove").delete(0, true)
      end,
      desc = "Delete Buffer (Force)"
    }, {
      "<leader>bda",
      ":%bd | e# | bd#<cr>",
      desc = "Delete all buffers except the current"
    }
    },
	},
}
