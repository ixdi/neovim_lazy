local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jj", "<esc>", "Exit insert mode")

-- Quick access to some common actions
map("n", ",w", "<cmd>w<cr>", "Write")
map("n", ",qq", "<cmd>q<cr>", "Quit")
map("n", ",qa", "<cmd>qa!<cr>", "Quit all")

-- Diagnostic keymaps
map("n", ",e", vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", "Increase size vertically")
map("n", "<C-Down>", ":resize -2<CR>", "Decrease size vertically")
map("n", "<C-Left>", ":vertical resize +2<CR>", "Increase size horizontal")
map("n", "<C-Right>", ":vertical resize -2<CR>", "Decrease size horizontal")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Prev buffer")

-- Stay in indent mode
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")

-- Clear after search
map("n", ",m", "<cmd>nohl<cr>", "Clear highlights")

-- Comments
map("n", "<leader>c",
    "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>")
map("v", "<leader>c",
    '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>')
