--------------------------
-- LINEFLY
--------------------------

return {
	"bluz71/nvim-linefly",
	config = function()
		vim.g.linefly_options = {
			tabline = true,
			progress_symbol = "",
		}
	end
}
