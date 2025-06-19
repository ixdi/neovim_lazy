-- luacheck: globals vim
local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jj", "<esc>", "Exit insert mode")

-- Quick access to some common actions
map("n", ",w", "<cmd>w<cr>", "Write")
map("n", ",qq", "<cmd>q<cr>", "Quit")
map("n", ",qa", "<cmd>qa!<cr>", "Quit all")

-- Diagnostic keymaps
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics under cursor")
map("n", "<leader>en", vim.diagnostic.goto_next)
map("n", "<leader>ep", vim.diagnostic.goto_prev)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "Next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Prev buffer")

-- Stay in indent mode
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")

-- Clear after search
map("n", ",m", "<cmd>nohl<cr>", "Clear highlights")

-- Yank without loosing the register
map("v", "p", '"_dP', "Yank without loosing the register")
