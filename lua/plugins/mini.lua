--------------------------
-- MINI STARTER
--------------------------

return {
	"echasnovski/mini.starter", version = "*",
	config = function()
		require('mini.starter').setup({
			header = "Welcome to Neovim",
			footer = "emaget_@fedora",
		})
	end
}
