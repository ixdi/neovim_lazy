-- Themes
return {
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	opts = {
	-- 		flavour = "macchiato", -- latte, frappe, macchiato, mocha
	-- 		integrations = {
	-- 			native_lsp = {
	-- 				enabled = true,
	-- 			},
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			telescope = true,
	-- 			which_key = true,
	-- 			neotree = true,
	-- 			treesitter = true,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	-- { "EdenEast/nightfox.nvim", name = "nordfox" },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	branch = "master",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			transparent = false,
	-- 			overrides = function(colors)
	-- 				return {
	-- 					["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
	-- 					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
	-- 					["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
	-- 					["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
	-- 					["@markup.list.markdown"] = { link = "Function" }, -- + list
	-- 					["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
	-- 					["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
	-- 				}
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
