--------------------------
-- COMPLETION
--------------------------

return {
	-- completion stuff
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	-- snippets with LuaSnip
	{ 'L3MON4D3/LuaSnip' },
	config = function()
		local cmp = require('cmp')

	end
}
