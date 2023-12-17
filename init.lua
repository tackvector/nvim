--------------------------
-- INIT FILE
--------------------------
-- Sources for this file:
-- 		https://www.youtube.com/watch?v=aqlxqpHs-aQ || this video helped me make better sense of the Lazy documentation, found here:
-- 		https://github.com/folke/lazy.nvim || this is the plugin manager we're using for this config
-- 		https://www.nerdfonts.com/font-downloads || this is where you can get the font I'm using (Iosevka Nerd Font)
-- 		https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window || this helped me learn about using autocmd in Lua, as did this:
-- 		https://www.youtube.com/watch?v=ekMIIAqTZ34&t=249s || ...which is a video that shows us a bit about them, and then this:
-- 		https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42 || which is where I saw the "pattern" parameter
-- 		https://neovim.io/doc/user/autocmd.html || also, here's a link to the autocmd documentation

--------------------------
-- IMPORTS
--------------------------
require 'dorraj.keymaps'
require 'dorraj.options'
require 'dorraj.neovide'

--------------------------
-- LAZY SETUP
--------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	ui = {
		border = "single"
	}
}

require("lazy").setup('plugins', opts)

---------------------------
-- COLOR SCHEME
---------------------------
---------------------------
-- FORMAT OPTIONS
---------------------------
-- set color scheme
    -- catppuccin
    -- everforest

-- don't enter comments on new lines following comments on preceding lines
    -- I found this answer here: https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim

vim.g.everforest_background = 'hard'

vim.cmd ([[ 
    autocmd FileType * set formatoptions-=cro 
    colorscheme everforest
]])

--------------------------
-- AUTOCOMMANDS
--------------------------

-- I want help files to open in a vertical split...
-- To do it the Vim way, do this:
-- vim.cmd 'autocmd Filetype help wincmd L'

-- To do it the Neovim way (that is to say, "in Lua"), do this:
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', command = ':wincmd L' })

-- it should be noted that the above only opens the help file in the vertical split once. albeit an unlikely occurrence, closing the file accidentally 
-- will result in the user needing to close and reopen Neovim to get it to work again.
