-- LSP Configuration & Plugins
return {
    {
        -- Set up Mason before anything else
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    check_outdated_packages_on_open = true,
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    }, {
        "williamboman/mason-lspconfig.nvim",
        requires = {"williamboman/mason.nvim"},
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    --[[ "ansiblels", "bashls", "cssls", "dockerls",
                    "docker_compose_language_service", "emmet_ls", "jsonls",
                    "lua_ls", "html", "marksman", "pylsp", "stylelint_lsp",
                    "markdownlint", "markuplint", "cssls", "dockerls",
                    "terraformls", "tsserver", "yamlls", "volar", "prettierd" ]]
                }
            })
        end
    }, {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim",
            "j-hui/fidget.nvim", "folke/neodev.nvim", "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp", "jose-elias-alvarez/typescript.nvim"
        },
        config = function()
            -- Neodev setup before LSP config
            require("neodev").setup()

            -- Turn on LSP status information
            require("fidget").setup({
                text = {
                    spinner = "pipe", -- animation shown when tasks are ongoing
                    done = "🗸", -- character shown when all tasks are complete
                    commenced = "Started", -- message shown when task starts
                    completed = "Completed" -- message shown when task completes
                }
            })

            local icons = require("config").icons.diagnostics
            -- Set up cool signs for diagnostics
            local signs = {
                Error = icons.Error,
                Warn = icons.Warn,
                Hint = icons.Hint,
                Info = icons.Info
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
            end

            -- Diagnostic config
            local config = {
                virtual_text = false,
                signs = {active = signs},
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = ""
                }
            }
            vim.diagnostic.config(config)

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, "Format",
                                                     function(_)
                    vim.lsp.buf.format()
                end, {desc = "Format current buffer with LSP"})

                lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")

                -- Attach and configure vim-illuminate
                require("illuminate").on_attach(client)
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(
                               capabilities)

            -- Lua
            require("lspconfig")["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {callSnippet = "Replace"},
                        diagnostics = {globals = {"vim", "require"}},
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true
                            }
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {enable = false}
                    }
                }
            })

            -- Python
            --[[ require("lspconfig")["pyright"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pyright = {
                        autoImportCompletion = true,
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                diagnosticMode = "diagnosticMode",
                                useLibraryCodeForTypes = true,
                                typeCheckingMode = "strict"
                            }
                        }
                    }
                }
            }) ]]
            require("lspconfig")["pylsp"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            black = {
                                enabled = true,
                                lineLength = 150 -- Black's line length
                            },
                            autopep8 = {enabled = false},
                            yapf = {enabled = false},
                            -- linter options
                            pylint = {
                                enabled = true,
                                executable = "pylint",
                                format = {maxLineLength = 150}
                            },
                            pyflakes = {enabled = false},
                            pycodestyle = {enabled = false},
                            -- type checker
                            pylsp_mypy = {
                                enabled = true,
                                report_progress = true,
                                live_mode = false
                            },
                            -- auto-completion options
                            jedi_completion = {fuzzy = true},
                            -- import sorting
                            pyls_isort = {enabled = true}
                        }
                    }
                }
            })

            -- Stylelint
            require("lspconfig")["stylelint_lsp"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    stylelintplus = {
                        -- see available options in stylelint-lsp documentation
                    }
                },
                filetypes = {"css", "scss"}
            })

            -- tsserver
            require("lspconfig")["tsserver"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    editor = {linkedEditing = true},
                    typescript = {
                        format = {
                            indentSize = vim.o.shiftwidth,
                            convertTabsToSpaces = vim.o.expandtab,
                            tabSize = vim.o.tabstop
                        }
                    },
                    javascript = {
                        format = {
                            indentSize = vim.o.shiftwidth,
                            convertTabsToSpaces = vim.o.expandtab,
                            tabSize = vim.o.tabstop
                        }
                    },
                    completions = {completeFunctionCalls = true}
                }
            })
        end
    }
}
