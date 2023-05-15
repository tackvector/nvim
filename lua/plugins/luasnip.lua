--------------------------
-- LUASNIP
--------------------------

return {
	'L3MON4D3/LuaSnip',
	lazy = true,
	version = "1.2.*",
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")
		luasnip.filetype_extend("typescriptreact", { "html", "typescript" })
		luasnip.filetype_extend("javascriptreact", { "html", "javascript" })
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}
