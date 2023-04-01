--------------------------
-- COMPLETION
--------------------------
-- I posted a question in the Neovim subreddit which led me to Kickstart. The thread is here:
	-- https://www.reddit.com/r/neovim/comments/127xvd1/what_am_i_missing/
-- the Kickstart.nvim init.lua file helped me figure out how to get this working, somewhat.
return {
	-- completion stuff
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'mtoohey31/cmp-fish',
		-- snippets with LuaSnip
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
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
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = 'nvim_lsp_document_symbol' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = "path" },
				{ name = "buffer", keyword_length = 5 },
				{ name = "fish" },
			}),
		}
	end
}
