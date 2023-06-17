--------------------------
-- TREESITTER
--------------------------

return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		pcall(require('nvim-treesitter.install').update { with_sync = true })
		require('nvim-treesitter.install').compilers = { "clang" }
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"lua",
				"javascript",
				"typescript",
				"python",
				"help",
				"tsx",
				"css",
				"json",
				"fish",
			},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
				disable = { "css" },
				additional_vim_regex_highlighting = false,
			},
			autopairs = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = { "python", "css" },
			},
		}
	end
}
