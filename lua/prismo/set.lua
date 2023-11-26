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
	pumheight = 5, -- set the popup menu height to 10
	termguicolors = true, -- enables 24-bit color in tui
	splitbelow = true, -- open new horizontal splits below current buffer
	splitright = true, -- open new vertical splits to the right of current buffer
	swapfile = false, -- don't create a swapfile
	timeoutlen = 1000, -- length of timeout for commands like 'jk' for exit
	cindent = true, -- for C files, which I do not write right now.
	numberwidth = 4, -- the width of the number column, setting it to 4 keeps it from pushing the editor over as numbers get larger
	signcolumn = 'yes', -- show signs in signcolumn
	wrap = false, -- don't wrap lines, makes it easier for me to take notes
	laststatus = 3, -- global statusline, thanks Neovim team :-)
	tabstop = 4, -- 4 spaces. 4 is the way. Don't fuck with the 4-ce. Okay, I'm done.
	softtabstop = 4,
	shiftwidth = 4,
	shiftround = true, -- found out about this from VimTricks. You should check it out if you haven't already! https://vim.town/@vimtricks
	guicursor = "n-v-c-i:block", -- i'll block you
	guifont = "Iosevka Term:h9", -- the font the bible is written in.
	shellxquote = "", -- i can use this to do cool things
	expandtab = true, -- changing things so they make sense to me
	autoindent = true, -- this should absolutely always be on
	smartindent = true, -- so should this.
	scrolloff = 5, -- like sidescrolloff but for the bottom side
	equalalways = false, -- all windows are made the same size after opening or closing
	mouse = "", -- i believe in mirac-- *cue broom*
}

-- for options and values in the options table, set them using vim.opt.<option> = <value>
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- instead of highlighting the line every time i want to see it
-- it makes sense to just have to current line hightlighted all the time
-- i've seen this in many TJ DeVries streams and wanted to know how he did it
-- i found this in a file in his config: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua

-- Thanks, TJ!
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- don't continue comments onto new lines
vim.cmd ([[ autocmd FileType * set formatoptions-=cro ]])

-- in netrw, open preview in vertical window
vim.g.netrw_preview = 1
