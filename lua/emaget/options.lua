--------------------------
-- GENERAL OPTIONS
--------------------------

local options = {
	backup = false,
	clipboard = 'unnamedplus',
	cmdheight = 1,
	conceallevel = 0,
	fileencoding = 'utf-8',
	hlsearch = false,
	incsearch = true,
	mouse = 'a',
	pumheight = 10,
	termguicolors = true,
	showtabline = 0,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	timeoutlen = 1000,
	updatetime = 100,
	undofile = true,
	writebackup = false,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	-- signcolumn = 'yes',
	wrap = false,
	sidescrolloff = 8,
	-- shortmess = 'I',
	laststatus = 3,
	tabstop = 4,
	shiftwidth = 4,
	guicursor = "n-v-c-i:block",
	guifont = "Iosevka Nerd Font Medium:h14",
	shellxquote = "",
	autoindent = true,
	smartindent = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
