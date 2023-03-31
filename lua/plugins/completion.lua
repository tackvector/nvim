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
		local luasnip = require('luasnip')
		local cmp = require('cmp')
		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			mapping = {
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-C>"] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},
				["<C-y>"] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				},
				["<C-space>"] = cmp.mapping.complete(),
			},
			sources = cmp.config.source({
				{ name = "luasnip" }
			})
		}
	end
}
