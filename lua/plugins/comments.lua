return {
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        config = function()
            require("Comment").setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = "<leader>c",
                    ---Block-comment toggle keymap
                    block = "<leader>cv"
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = "<leader>cl",
                    ---Block-comment keymap
                    block = "<leader>cb"
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = "<leader>cu",
                    ---Add comment on the line below
                    below = "<leader>cd",
                    ---Add comment at the end of line
                    eol = "<leader>ce"
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true
                },
                ---Function to call before (un)comment
                pre_hook = nil,
                ---Function to call after (un)comment
                post_hook = nil
            })
        end,
        lazy = false
    }, -- Finds and lists all of the TODO, HACK, BUG, etc comment
    -- in your project and loads them into a browsable list.
    {
        "folke/todo-comments.nvim",
        cmd = {"TodoTrouble", "TodoTelescope"},
        event = {"BufReadPost", "BufNewFile"},
        config = true,
        -- stylua: ignore
        keys = {
            {
                "<leader>tn",
                function() require("todo-comments").jump_next() end,
                desc = "Next todo comment"
            }, {
                "<leader>tp",
                function() require("todo-comments").jump_prev() end,
                desc = "Previous todo comment"
            }, {"<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)"},
            {
                "<leader>xT",
                "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
                desc = "Todo/Fix/Fixme (Trouble)"
            }, {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo"}, {
                "<leader>sT",
                "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
                desc = "Todo/Fix/Fixme"
            }
        }
    }
}
