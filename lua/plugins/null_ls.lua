--------------------------
-- NULL-LS
--------------------------

return {
	'jose-elias-alvarez/null-ls.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local null_ls = require('null-ls')

		local code_actions = null_ls.builtins.code_actions -- code actions sources
		local diagnostics = null_ls.builtins.diagnostics -- diagnostics sources
		local formatting = null_ls.builtins.formatting -- formatting sources 
		local hover = null_ls.builtins.hover -- hover sources 
		local completion = null_ls.builtins.completion -- completion sources
		local spell = null_ls.builtins.completion.spell -- spelling sources

		local sources = {
			code_actions.eslint_d,
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.cpplint,
			diagnostics.eslint_d,
			diagnostics.pyright,
		}

		null_ls.setup({ sources = sources })
	end
}
