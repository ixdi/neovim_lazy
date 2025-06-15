-- luacheck: globals vim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opts = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- copy/paste to system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	cursorline = true, -- highlight the current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = "utf-8", -- the encoding written to a file
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	laststatus = 3, -- only the last window will always have a status line
	linebreak = true,
	mouse = "a", -- allow the mouse to be used in neovim
	number = true,
	numberwidth = 2, -- minimal number of columns to use for the line number {default 4}
	pumheight = 10, -- pop up menu height
	relativenumber = true,
	ruler = false, -- hide the line and column number of the cursor position
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	showcmd = false, -- hide (partial) command in the last line of the screen (for performance)
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	sidescrolloff = 8, -- minimal number of screen columns to keep to the left and right of the cursor if wrap is false
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	tabstop = 2, -- insert 2 spaces for a tab
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	wrap = false,
	writebackup = false, -- if a file is being edited by another program it is not allowed to be edited
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.opt[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

-- Open binary files
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !evince " .. filename .. " &")
		vim.cmd('exe "bd! "')
	end,
})

vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !loupe " .. filename .. " &")
		vim.cmd('exe "bd! "')
	end,
})
