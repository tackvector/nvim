--------------------------
-- MOONFLY COLORS
--------------------------

return {
	'bluz71/vim-moonfly-colors', name = 'moonfly',
	lazy = true,
	priority = 1000,
	config = function ()
		vim.g.moonflyWinSeparator = 2 -- display line separator
		vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', } -- improve the look of the separators
	end
}
