return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"
        },
        lazy = true,
        opts = {
            prompt_func_return_type = {
                c = false,
                cpp = true,
                cxx = false,
                go = false,
                h = false,
                hpp = false,
                java = false,
                js = true,
                ts = true,
                py = true
            },
            prompt_func_param_type = {
                c = false,
                cpp = true,
                cxx = false,
                go = false,
                h = false,
                hpp = false,
                java = false,
                js = true,
                ts = true,
                py = true
            },
            printf_statements = {},
            print_var_statements = {}
        },
        config = function()
            require("refactoring").setup()
            -- load refactoring Telescope extension
            require("telescope").load_extension("refactoring")
        end
    }
}
