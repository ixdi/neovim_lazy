-- snippets

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

require("luasnip").setup({
	history = true,
	delete_check_events = "TextChanged",
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Re-run make install_jsregex after pack changes",
	group = vim.api.nvim_create_augroup("LuaSnipPackChanged", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "luasnip" and (kind == "install" or kind == "update") then
			vim.system({ "make install_jsregexp" }, { cwd = ev.data.path })
			vim.notify("LuaSnip installed, running make install_jsregexp...", vim.log.levels.INFO)
		end
	end,
})
