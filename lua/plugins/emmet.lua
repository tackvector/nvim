--------------------------
-- EMMET
--------------------------

return {
	"mattn/emmet-vim",
	config = function ()
		vim.g.user_emmer_install_global = 0
		vim.api.nvim_create_autocmd('FileType', { pattern = 'html, css', command = ':EmmetInstall'})
	end
}
