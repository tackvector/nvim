--------------------------
-- VIMTEX
--------------------------

return  {
	'lervag/vimtex',
	config = function ()
		vim.cmd [[ filetype plugin indent on ]]
		vim.cmd [[ syntax enable ]]
		vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_compiler_method = 'latexmk'
	end
}
