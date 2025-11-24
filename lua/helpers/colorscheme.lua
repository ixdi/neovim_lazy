-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
	local lua_ok, colorscheme = pcall(require, name)
	if lua_ok then
		colorscheme.setup(opts)
		return name
	end

	local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
	if vim_ok then
		return name
	end

	return "default"
end

-- Uncomment the colorscheme to use
-- local colorscheme = get_if_available("nordfox") --nightfox, duskfox, terafox, nordfox
-- local colorscheme = get_if_available("kanagawa", {
-- 	compile = true,
-- 	transparent = false,
-- 	theme = "wave", -- "wave" | "lotus" | "dragon"
-- 	overrides = function(colors)
-- 		return {
-- 			["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
-- 			["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
-- 			["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
-- 			["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
-- 			["@markup.list.markdown"] = { link = "Function" }, -- + list
-- 			["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
-- 			["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
-- 		}
-- 	end,
-- })
-- local colorscheme = get_if_available("tokyonight-night")
-- local colorscheme = get_if_available("catppuccin")
local colorscheme = get_if_available("nordic", {
	-- Enable bold keywords.
	bold_keywords = false,
	-- Enable italic comments.
	italic_comments = true,
	-- Enable editor background transparency.
	transparent = {
		-- Enable transparent background.
		bg = false,
		-- Enable transparent background for floating windows.
		float = false,
	},
	-- Enable brighter float border.
	bright_border = false,
	-- Reduce the overall amount of blue in the theme (diverges from base Nord).
	reduced_blue = true,
	-- Swap the dark background with the normal one.
	swap_backgrounds = false,
	-- Cursorline options.  Also includes visual/selection.
	cursorline = {
		-- Bold font in cursorline.
		bold = false,
		-- Bold cursorline number.
		bold_number = true,
		-- Available styles: 'dark', 'light'.
		theme = "light",
		-- Blending the cursorline bg with the buffer bg.
		blend = 0.85,
	},
	noice = {
		-- Available styles: `classic`, `flat`.
		style = "classic",
	},
	telescope = {
		-- Available styles: `classic`, `flat`.
		style = "classic",
	},
	leap = {
		-- Dims the backdrop when using leap.
		dim_backdrop = false,
	},
	ts_context = {
		-- Enables dark background for treesitter-context window
		dark_background = true,
	},
})

return colorscheme
