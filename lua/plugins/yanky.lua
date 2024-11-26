vim.g.clipboard = {
  name = "xsel_override",
  copy = {
    ["+"] = "xsel --input --clipboard",
    ["*"] = "xsel --input --primary",
  },
  paste = {
    ["+"] = "xsel --output --clipboard",
    ["*"] = "xsel --output --primary",
  },
  --[[ copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste",
		["*"] = "wl-paste",
	}, ]]
  cache_enabled = 1,
}

return {
  {
    "gbprod/yanky.nvim",
    opts = function()
      local mapping = require("yanky.telescope.mapping")
      local mappings = mapping.get_defaults()
      mappings.i["<c-p>"] = nil
      return {
        highlight = { on_put = true, on_yank = true, timer = 500 },
        ring = {
          history_length = 300,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
          ignore_registers = { "_" },
          update_register_on_cycle = false,
        },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = mappings,
          },
        },
        preserve_cursor_position = { enabled = true },
        system_clipboard = {
          sync_with_ring = true,
          clipboard_register = "unnamedplus",
        },
        textobj = {
          enabled = true,
        },
      }
    end,
    keys = {
      {
        "<leader>p",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after cursor",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before cursor",
      },
      {
        "<C-y>",
        "<Plug>(YankyCycleForward)",
        desc = "Cycle forward through yank history",
      },
      {
        "<C-S-Y>",
        "<Plug>(YankyCycleBackward)",
        desc = "Cycle backward through yank history",
      },
      {
        "<C-p>",
        "<Plug>(YankyPutIndentAfterLinewise)",
        desc = "Put indented after cursor (linewise)",
      },
      {
        "<C-S-P>",
        "<Plug>(YankyPutIndentBeforeLinewise)",
        desc = "Put indented before cursor (linewise)",
      },
    },
  },
}
