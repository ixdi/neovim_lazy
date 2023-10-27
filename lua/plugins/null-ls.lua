return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                debug = false,
                sources = {
                    code_actions.eslint_d, code_actions.gitsigns,
                    code_actions.refactoring,
                    diagnostics.eslint_d
                        .with({disabled_filetypes = {"typescript"}}),
                    diagnostics.luacheck, diagnostics.markdownlint, -- diagnostics.misspell,
                    -- formatting.autopep8, -- formatting.isort, -- formatting.black,
                    formatting.stylua, formatting.fixjson,
                    formatting.lua_format, formatting.markdownlint,
                    formatting.prettierd, formatting.yamlfmt
                },
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    bufnr = bufnr,
                                    filter = function(_client)
                                        return _client.name == "null-ls"
                                    end
                                })
                            end
                        })
                    end
                end
            })
        end
    }
}
