return {
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {"nvim-lua/plenary.nvim"},
        keys = {{",g", ":LazyGit<cr>", desc = "LazyGit"}}
    }
}
