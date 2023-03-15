--------------------------
-- PAPYRUS
--------------------------

return {
	'abeleinin/papyrus',
	config = function ()
		local opts = { noremap = true }

		vim.g.papyrus_latex_engine = "pdflatex"
		vim.g.papyrus_viewer = "C://Users//AppData//Local//SumatraPDF -reuse-instance"

		vim.keymap.set("n", "<leader>pc", ":PapyrusCompile<cr>", opts)
		vim.keymap.set("n", "<leader>pa", ":PapyrusAutoCompile<cr>", opts)
		vim.keymap.set("n", "<leader>pv", ":PapyrusView<cr>", opts)
		vim.keymap.set("n", "<leader>ps", ":PapyrusStart<cr>", opts)
	end,
}
