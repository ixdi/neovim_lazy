-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local M = {}

M.lazy_version = ">=11.0"

-- icons used by other plugins
M.icons = {
	dap = {
		Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
		Breakpoint = " ",
		BreakpointCondition = " ",
		BreakpointRejected = { " ", "DiagnosticError" },
		LogPoint = ".>",
	},
	diagnostics = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " },
	git = {
		added = " ",
		modified = " ",
		removed = " ",
		Staged = "✓ ",
		Unstaged = " ",
		Unmerged = " ",
		Renamed = "➜ ",
		Untracked = "★ ",
		Ignored = "◌ ",
	},
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
		Snippet = "❝",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
}

return M
