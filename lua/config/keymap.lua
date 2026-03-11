-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.jump or vim.diagnostic.jump
	local count = next and 1 or -1
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ count = count, severity = severity })
	end
end

-- Blazingly fast way out of insert mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.hover, { desc = "Hover" })

-- Quick access to some common actions
vim.keymap.set("n", ",w", "<cmd>w<cr>", { desc = "Write" })
vim.keymap.set("n", ",qq", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", ",qa", "<cmd>qa!<cr>", { desc = "Quit all" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<leader>en", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>ep", diagnostic_goto(false), { desc = "Prev Diagnostic" })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })

-- Clear after search
vim.keymap.set("n", ",m", "<cmd>nohl<cr>", { desc = "Clear highlights" })
