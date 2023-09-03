return {
    -- which-key helps you remember key bindings by showing a popup
    -- with the active keybindings of the command you started typing.
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = {spelling = true},
            defaults = {
                mode = {"n", "v"},
                ["g"] = {name = "+goto"},
                ["gz"] = {name = "+surround"},
                ["]"] = {name = "+next"},
                ["["] = {name = "+prev"},
                ["<leader><tab>"] = {name = "+tabs"},
                ["<leader>bu"] = {name = "+buffer"},
                ["<leader>co"] = {name = "+code"},
                ["<leader>fi"] = {name = "+file/find"},
                ["<leader>git"] = {name = "+git"},
                ["<leader>gh"] = {name = "+hunks"},
                ["<leader>qu"] = {name = "+quit/session"},
                ["<leader>sr"] = {name = "+search"},
                ["<leader>ui"] = {name = "+ui"},
                ["<leader>win"] = {name = "+windows"},
                ["<leader>fix"] = {name = "+diagnostics/quickfix"}
            }
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end
    }
}
