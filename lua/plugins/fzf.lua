--------------------------
-- TELESCOPE FZF NATIVE
--------------------------

return {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make',
	config = function()
		pcall(require('telescope').load_extension, 'fzf')
		return vim.fn.executable 'make' == 1
	end
}
