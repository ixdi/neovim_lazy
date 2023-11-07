vim.g.clipboard = {
    name = "xsel_override",
    copy = {
        ["+"] = "xsel --input --clipboard",
        ["*"] = "xsel --input --primary"
    },
    paste = {
        ["+"] = "xsel --output --clipboard",
        ["*"] = "xsel --output --primary"
    },
    cache_enabled = 1
}

return {
    {
        "gbprod/yanky.nvim",
        dependencies = {{"kkharji/sqlite.lua", enabled = true}},
        opts = function()
            local mapping = require("yanky.telescope.mapping")
            local mappings = mapping.get_defaults()
            mappings.i["<c-p>"] = nil
            return {
                highlight = {on_put = true, on_yank = true, timer = 500},
                ring = {
                    history_length = 200,
                    storage = "sqlite",
                    storage_path = vim.fn.stdpath("data") ..
                        "/databases/yanky.db",
                    sync_with_numbered_registers = true,
                    cancel_event = "update",
                    ignore_registers = {"_"}
                },
                picker = {
                    telescope = {
                        use_default_mappings = false,
                        mappings = mappings
                    }
                },
                preserve_cursor_position = {enabled = true},
                system_clipboard = {sync_with_ring = true}
            }
        end,
        keys = {
            {
                "<leader>p",
                function()
                    require("telescope").extensions.yank_history
                        .yank_history({})
                end,
                desc = "Open Yank History"
            },
            {"y", "<Plug>(YankyYank)", mode = {"n", "x"}, desc = "Yank text"},
            {
                "<C-p>",
                "<Plug>(YankyPutAfter)",
                mode = {"n", "x"},
                desc = "Put yanked text after cursor"
            }, {
                "<C-P>",
                "<Plug>(YankyPutBefore)",
                mode = {"n", "x"},
                desc = "Put yanked text before cursor"
            }, {
                "[y",
                "<Plug>(YankyCycleForward)",
                desc = "Cycle forward through yank history"
            }, {
                "]y",
                "<Plug>(YankyCycleBackward)",
                desc = "Cycle backward through yank history"
            }, {
                "p",
                "<Plug>(YankyPutIndentAfterLinewise)",
                desc = "Put indented after cursor (linewise)"
            }, {
                "P",
                "<Plug>(YankyPutIndentBeforeLinewise)",
                desc = "Put indented before cursor (linewise)"
            }
        }
    }
}
