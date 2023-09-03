---@type LazyVimConfig
local M = {}

M.lazy_version = ">=9.1.0"

---@class LazyVimConfig
-- icons used by other plugins
M.icons = {
    dap = {
        Stopped = {"󰁕 ", "DiagnosticWarn", "DapStoppedLine"},
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = {" ", "DiagnosticError"},
        LogPoint = ".>"
    },
    diagnostics = {Error = " ", Warn = " ", Hint = "󰌵", Info = " "},
    git = {added = " ", modified = " ", removed = " "},
    kinds = {
        Array = " ",
        Boolean = " ",
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Copilot = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = " ",
        Key = " ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Namespace = " ",
        Null = " ",
        Number = " ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        String = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = " ",
        Value = " ",
        Variable = " "
    }
}

M.renames = {["windwp/nvim-spectre"] = "nvim-pack/nvim-spectre"}

return M
