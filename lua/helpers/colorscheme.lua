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
--local colorscheme = get_if_available("nordfox")
local colorscheme = get_if_available("kanagawa", {
	transparent = false,
	overrides = function(colors)
		return {
			["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
			["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
			["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
			["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
			["@markup.list.markdown"] = { link = "Function" }, -- + list
			["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
			["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
		}
	end,
})

return colorscheme
