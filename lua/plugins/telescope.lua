-- luacheck: globals vim
return {
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
        cmd = "Telescope",
        version = false, -- telescope did only one release, so use HEAD for now
        config = function()
            require("telescope").load_extension("file_browser")
        end,
        keys = {
            {
                "<leader>dc",
                ":lua vim.lsp.buf.declaration()<cr>",
                desc = "Buffer declaration"
            },
            {
                "<leader>d",
                ":Telescope lsp_definitions<cr>",
                desc = "Code definitions"
            },
            {
                "<leader><leader>",
                ":lua vim.lsp.buf.hover()<cr>",
                desc = "Code hover"
            }, {
                "<leader>i",
                ":Telescope lsp_implementations<cr>",
                desc = "Code implementations"
            },
            {
                "<leader>r",
                ":Telescope lsp_references<cr>",
                desc = "Code references"
            }, {"<leader>k", ":Telescope keymaps<cr>", desc = "Keymaps"},
            {
                "<leader>ee",
                ":Telescope diagnostics<cr>",
                desc = "Code diagnostics"
            },
            {
                "<leader>a",
                ":lua vim.lsp.buf.code_action()<cr>",
                desc = "Code actions"
            }, {
                ",en",
                ":lua vim.diagnostic.goto_next({buffer=0})<cr>",
                desc = "Next diagnostic"
            },
            {
                ",ls",
                ":lua vim.lst.buf.signature_help()<cr>",
                desc = "Signature help"
            },
            {
                "<leader>ci",
                ":Telescope lsp_incoming_calls<cr>",
                desc = "Code incommings"
            },
            {
                "<leader>co",
                ":Telescope lsp_outgoing_calls<cr>",
                desc = "Code outgoings"
            }, {"<leader>fi", ":Telescope find_files<cr>", desc = "Find files"},
            {"<leader>u", ":Telescope oldfiles<cr>", desc = "Recent files"},
            {"<leader>f", ":Telescope live_grep<cr>", desc = "Live grep"},
            {"<leader>l", ":Telescope resume<cr>", desc = "Resume"}, {
                "<leader>ex",
                ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
                desc = "File browser"
            }
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                shorten_path = true,
                path_display = {"smart"},
                file_ignore_patterns = {
                    ".git", "node_modules", ".meteor", "public",
                    "imports/externals", "packages"
                },
                vimgrep_arguments = {
                    "rg", "--color=never", "--no-heading", "--with-filename",
                    "--line-number", "--column", "--smart-case"
                },
                mappings = {
                    i = {
                        ["<c-t>"] = function(...)
                            return
                                require("trouble.providers.telescope").open_with_trouble(
                                    ...)
                        end,
                        ["<a-t>"] = function(...)
                            return
                                require("trouble.providers.telescope").open_selected_with_trouble(
                                    ...)
                        end,
                        ["<C-Down>"] = function(...)
                            return
                                require("telescope.actions").cycle_history_next(
                                    ...)
                        end,
                        ["<C-Up>"] = function(...)
                            return
                                require("telescope.actions").cycle_history_prev(
                                    ...)
                        end,
                        ["<C-f>"] = function(...)
                            return
                                require("telescope.actions").preview_scrolling_down(
                                    ...)
                        end,
                        ["<C-b>"] = function(...)
                            return
                                require("telescope.actions").preview_scrolling_up(
                                    ...)
                        end
                    },
                    n = {
                        ["q"] = function(...)
                            return require("telescope.actions").close(...)
                        end
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                file_browser = {
                    theme = "ivy",
                    grouped = false,
                    files = true,
                    add_dirs = true,
                    depth = 5,
                    auto_depth = true,
                    select_buffer = false,
                    hidden = {file_browser = false, folder_browser = false},
                    -- respect_gitignore
                    -- browse_files
                    -- browse_folders
                    hide_parent_dir = false,
                    collapse_dirs = true,
                    prompt_path = false,
                    quiet = false,
                    dir_icon = "",
                    dir_icon_hl = "Default",
                    display_stat = {date = true, size = true, mode = true},
                    use_fd = true,
                    git_status = true,
                    cwd_to_path = false,
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        }
                    }
                }
            }
        }
    }, {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"
        }
    }
}
