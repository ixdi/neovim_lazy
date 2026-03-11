-- snippets

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

require("luasnip").setup({
	history = true,
	delete_check_events = "TextChanged",
})
