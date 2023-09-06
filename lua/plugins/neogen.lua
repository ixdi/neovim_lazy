return {
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- uncomment next line if you want to follow only stable versions
        -- version = "*"
        --
        keys = {{"<leader>d", ":Neogen<cr>", desc = "comment code"}},
        opts = {
            languages = {
                lua = {template = {annotation_convention = "emmylua"}},
                python = {template = {annotation_convention = "reST"}},
                javascript = {template = {annotation_convention = "jsdoc"}},
                typescript = {template = {annotation_convention = "tsdoc"}}
            }
        }
    }
}
