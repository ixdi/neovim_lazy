vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.linebreak = true -- companion to wrap, don't split words
vim.g.mapleader = "," -- set leader key
vim.opt.mousehide = true -- hide mouse when typing
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 2 -- minimal number of columns to use for the line number {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true
vim.opt.ruler = false -- hide the line and column number of the cursor position
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is false
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.wrap = false
vim.opt.writebackup = false -- if a file is being edited by another program it is not allowed to be edited
vim.opt.winborder = "rounded" -- set window borders

vim.g.clipboard = {
	-- name = "xsel_override",
	-- copy = {
	-- 	["+"] = "xsel --input --clipboard",
	-- 	["*"] = "xsel --input --primary",
	-- },
	-- paste = {
	-- 	["+"] = "xsel --output --clipboard",
	-- 	["*"] = "xsel --output --primary",
	-- },
	name = "wl-clipboard (wsl)",
	copy = {
		["+"] = "wl-copy --foreground --type text/plain",
		["*"] = "wl-copy --foreground --primary --type text/plain",
	},
	paste = {
		["+"] = "wl-paste",
		["*"] = "wl-paste --primary",
	},
	cache_enabled = 1,
}

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
