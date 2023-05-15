--------------------------
-- TODO HIGHLIGHT
--------------------------

return {
	'folke/todo-comments.nvim',
	lazy = true,
	dependencies = {
		{'nvim-lua/plenary.nvim'},
	},
	config = function()
		require('todo-comments').setup()
	end
}
