--------------------------
-- LSP ZERO
--------------------------
-- Pumpkins by less.people

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	-- supporting all the lsp stuff
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },

		-- autocompleting all the things
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },

		-- getting snippy with neovim
		{ 'L3MON4D3/LuaSnip' },
	},
	config = function()
		local lsp = require('lsp-zero').preset({
			name = 'minimal',
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = false,
		})

		local cmp = require('cmp')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		lsp.setup_nvim_cmp({
			mapping = lsp.defaults.cmp_mappings({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(),
			})
		})

		lsp.on_attach(
			function (client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
				vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
				vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set('n', 'gk', function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set('n', 'gj', function() vim.diagnostic.goto_next() end, opts)
			end
		)

		lsp.nvim_workspace()
		lsp.setup()
	end
}
