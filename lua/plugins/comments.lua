return {
    -- comments
    {"JoosepAlviste/nvim-ts-context-commentstring", lazy = true}, {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            options = {
                custom_commentstring = function()
                    return
                        require("ts_context_commentstring.internal").calculate_commentstring() or
                            vim.bo.commentstring
                end
            },
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                comment = "<leader>cc",
                -- Toggle comment on current line
                comment_line = "<leader>c",
                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                textobject = "gc"
            }
        }
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
