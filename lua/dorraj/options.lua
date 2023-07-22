--------------------------
-- GENERAL OPTIONS
--------------------------

local options = {
	backup = false, -- no backups
	clipboard = 'unnamedplus', -- always use clipboard for all operations
	cmdheight = 1, -- set height of command-line to 1
	conceallevel = 0, -- show text normally
	fileencoding = 'utf-8', -- file encoding for current buffer
	hlsearch = false, -- don't highlight matches
	incsearch = true, -- show the pattern matches as i type
	mouse = 'a', -- enable mouse for 'all previous modes'
	pumheight = 10, -- set the popup menu height to 10
	termguicolors = true, -- enables 24-bit color in tui
	splitbelow = true, -- open new horizontal splits below current buffer
	splitright = true, -- open new vertical splits to the right of current buffer
	swapfile = false, -- don't create a swapfile
	timeoutlen = 1000, -- length of timeout for commands like 'jk' for exit
	undofile = true, -- i actually don't understand this option yet; will need to dig further.
	writebackup = false,  -- don't make backup before overwriting files
	number = true, -- set line numbers, this setting shows the line number you're currently on
	relativenumber = true, -- make the line numbers relatives..."what are you doing, stepnumber?"
	cindent = true, -- for C files, which I do not write right now.
	numberwidth = 4, -- the width of the number column, setting it to 4 keeps it from pushing the editor over as numbers get larger
	signcolumn = 'yes', -- show signs in signcolumn
	wrap = false, -- don't wrap lines, makes it easier for me to take notes
	sidescrolloff = 30, -- numbers of columns to keep on sides of screen, may not be good for error messages on certain lines...don't know yet.
	laststatus = 3, -- global statusline, thanks Neovim team :-)
	tabstop = 4, -- 4 spaces. 4 is the way. Don't fuck with the 4-ce.
	softtabstop = 0,
	shiftwidth = 0, -- i actually don't know if i need this one either. Haven't done any testing without it yet.
	shiftround = true, -- found out about this from VimTricks, you should check it out if you haven't already! https://vim.town/@vimtricks
	guicursor = "n-v-c-i:block", -- be a man. use a block cursor.
	guifont = "Iosevka Nerd Font Medium:h18", -- the font the bible is written in.
	shellxquote = "", -- i can use this to do cool things
	autoindent = true, -- this should absolutely always be on
	smartindent = true, -- so should this.
	scrolloff = 10, -- like sidescrolloff but for the bottom side
	equalalways = false, -- all windows are made the same size after opening or closing
	list = true,
	listchars = { eol = '', tab = ' ' },
}

-- for options and values in the options table, set them using vim.opt.<option> = <value>
for k, v in pairs(options) do
	vim.opt[k] = v
end

