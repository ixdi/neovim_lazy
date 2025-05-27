-- luacheck: globals vim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opts = {
	backup = false, -- creates a backup file
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	clipboard = "unnamedplus", -- copy/paste to system clipboard
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	laststatus = 3, -- only the last window will always have a status line
	showcmd = false, -- hide (partial) command in the last line of the screen (for performance)
	ruler = false, -- hide the line and column number of the cursor position
	numberwidth = 2, -- minimal number of columns to use for the line number {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns to keep to the left and right of the cursor if wrap is false
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	linebreak = true,
	wrap = false,
	number = true,
	relativenumber = true,
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
