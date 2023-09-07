-- luacheck: globals vim
-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.python3_host_prog = "/opt/miniconda3/bin/python3"

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then return end

-- We have to set the leader key here for lazy.nvim to work
require("helpers.keys").set_leader(" ")

-- Load plugins from specifications
-- (The leader key must be set before this)
lazy.setup("plugins", {
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = {width = 0.8, height = 0.8},
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",
        title = nil, ---@type string only works when border is not "none"
        title_pos = "center", ---@type "center" | "left" | "right"
        -- Show pills on top of the Lazy window
        pills = true, ---@type boolean
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "󰒲 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "🗸",
            list = {"●", "➜", "★", "‒"}
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false

            -- open lazygit log
            ["<localleader>l"] = function(plugin)
                require("lazy.util").float_term({"lazygit", "log"},
                                                {cwd = plugin.dir})
            end,

            -- open a terminal for the plugin dir
            ["<localleader>t"] = function(plugin)
                require("lazy.util").float_term(nil, {cwd = plugin.dir})
            end
        }
    }
})

-- Might as well set up an easy-access keybinding
require("helpers.keys").map("n", "<leader>L", lazy.show, "Show Lazy")
