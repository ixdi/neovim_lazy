-- luacheck: globals vim
local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jj", "<esc>", "Exit insert mode")

-- Quick access to some common actions
map("n", ",w", "<cmd>w<cr>", "Write")
map("n", ",qq", "<cmd>q<cr>", "Quit")
map("n", ",qa", "<cmd>qa!<cr>", "Quit all")

-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.jump or vim.diagnostic.jump
	local count = next and 1 or -1
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ count = count, severity = severity })
	end
end
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics under cursor")
map("n", "<leader>en", diagnostic_goto(true), "Next Diagnostic")
map("n", "<leader>ep", diagnostic_goto(false), "Prev Diagnostic")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Prev buffer")

-- Stay in indent mode
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")

-- Clear after search
map("n", ",m", "<cmd>nohl<cr>", "Clear highlights")
