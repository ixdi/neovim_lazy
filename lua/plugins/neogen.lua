return {
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- uncomment next line if you want to follow only stable versions
        -- version = "*" 
        --
        keys = {
            {
                ",d",
                ":lua require('neogen').generate()<cr>",
                desc = "comment code"
            }
        },
        opts = {
            languages = {
                lua = {template = {annotation_convention = "emmylua"}},
                python = {template = {annotation_convention = "reST"}},
                typescript = {template = {annotation_convention = "jsdoc"}}
            }
        }
    }
}
