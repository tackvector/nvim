--------------------------
-- CODE RUNNER
--------------------------

return {
	"CRAG666/code_runner.nvim",
	config = function ()
	require('code_runner').setup({
		mode = "toggleterm",
		filetype = {
				javascript = "node $fileName",
				python = "python $fileName",
				typescript = "tsc $fileName",
				lua = "lua $fileName",
				c = "cd . && gcc $fileName -o $fileNameWithoutExt && $dir\\$fileNameWithoutExt",
				cpp = "cd . && g++ $fileName -o $fileNameWithoutExt && $dir\\$fileNameWithoutExt",
				cs = " cd . && scriptcs $fileName"
			},
		term = {
				position = "bot",
				size = 20,
			}
		})
	end
}
