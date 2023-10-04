return {
    -- surr*ound_words             ysiw)           (surround_words)
    --   *make strings               ys$"            "make strings"
    --   [delete ar*ound me!]        ds]             delete around me!
    --   remove <b>HTML t*ags</b>    dst             remove HTML tags
    --   'change quot*es'            cs'"            "change quotes"
    --   <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --   delete(functi*on calls)     dsf             function calls
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "ys",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "ds",
                    change = "cs",
                    change_line = "cS"
                }
            })
        end
    }
    -- Fast and feature-rich surround actions. For text that includes
    -- surrounding characters like brackets or quotes, this allows you
    -- to select the text inside, change or modify the surrounding characters,
    -- and more.
    -- {
    --     "echasnovski/mini.surround",
    --     opts = {
    --         -- Add custom surroundings to be used on top of builtin ones. For more
    --         -- information with examples, see `:h MiniSurround.config`.
    --         custom_surroundings = nil,
    --
    --         -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    --         highlight_duration = 500,
    --         mappings = {
    --             add = "gza", -- Add surrounding in Normal and Visual modes
    --             delete = "gzd", -- Delete surrounding
    --             find = "gzf", -- Find surrounding (to the right)
    --             find_left = "gzF", -- Find surrounding (to the left)
    --             highlight = "gzh", -- Highlight surrounding
    --             replace = "gzr", -- Replace surrounding
    --             update_n_lines = "gzn" -- Update `n_lines`
    --         },
    --         -- Number of lines within which surrounding is searched
    --         n_lines = 20,
    --         -- Whether to respect selection type:
    --         -- - Place surroundings on separate lines in linewise mode.
    --         -- - Place surroundings on each line in blockwise mode.
    --         respect_selection_type = false,
    --         -- How to search for surrounding (first inside current line, then inside
    --         -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    --         -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
    --         -- see `:h MiniSurround.config`.
    --         search_method = "cover",
    --         -- Whether to disable showing non-error feedback
    --         silent = false
    --     }
    -- }
}
