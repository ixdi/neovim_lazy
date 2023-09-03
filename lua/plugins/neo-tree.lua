-- Nicer filetree than NeoTreeWinSeparator
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
local icons = require("config").icons

vim.fn.sign_define("DiagnosticSignError", {
    text = icons.diagnostics.Error,
    texthl = "DiagnosticSignError"
})
vim.fn.sign_define("DiagnosticSignWarn", {
    text = icons.diagnostics.Warn,
    texthl = "DiagnosticSignWarn"
})
vim.fn.sign_define("DiagnosticSignInfo", {
    text = icons.diagnostics.Info,
    texthl = "DiagnosticSignInfo"
})
vim.fn.sign_define("DiagnosticSignHint", {
    text = icons.diagnostics.Hint,
    texthl = "DiagnosticSignHint"
})

return {
    -- file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        },
        cmd = "Neotree",
        keys = {
            {
                "<leader>e",
                function()
                    require("neo-tree.command").execute({
                        toggle = true,
                        reveal = true
                    })
                end,
                desc = "Explorer NeoTree (root dir)"
            }, {
                "<leader>eb",
                function()
                    require("neo-tree.sources.buffers.commands").execute({
                        toggle = true,
                        reveal = true
                    })
                end,
                desc = "Explorer NeoTree (buffers)"
            }, {
                "<leader>es",
                function()
                    require("neo-tree.sources.document_symbols.commands").execute(
                        {toggle = true, reveal = true})
                end,
                desc = "Explorer NeoTree (document_symbols)"
            }
        },
        opts = {
            sources = {
                "filesystem", "buffers", "git_status", "document_symbols"
            },
            open_files_do_not_replace_types = {
                "terminal", "Trouble", "qf", "Outline"
            },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = {enabled = true},
                use_libuv_file_watcher = true
            },
            window = {
                mappings = {
                    ["<space>"] = "toggle_node",
                    ["o"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                    ["?"] = {
                        "show_help",
                        nowait = false,
                        config = {title = "Order by", prefix_key = "o"}
                    }
                }
            },
            default_component_configs = {
                symbols = {
                    -- Change type
                    added = icons.git.added,
                    deleted = icons.git.removed,
                    modified = icons.git.modified,
                    renamed = "󰁕",
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = ""
                },
                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander"
                }
            }
        },
        config = function(_, opts)
            require("neo-tree").setup(opts)
            vim.api.nvim_create_autocmd("TermClose", {
                pattern = "*lazygit",
                callback = function()
                    if package.loaded["neo-tree.sources.git_status"] then
                        require("neo-tree.sources.git_status").refresh()
                    end
                end
            })
        end
    }
}
