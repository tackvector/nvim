M = {}

local opts = { silent = true } -- i don't want to have to write these after every keymap
local term_opts = { silent = true } -- same for the terminal keybindings

vim.keymap.set('n', '<Space>', '', opts) -- I don't remember why this is useful but I'm not deleting it

vim.g.mapleader = ' ' -- set leader
vim.g.maplocalleader = ' ' -- set local leader

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- move through buffers easily, better with tabline on or with bufferline installed
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- a nifty way to navigate buffers, found here: https://www.reddit.com/r/vim/comments/g4l5p0/good_plugin_to_navigate_buffers/
vim.keymap.set("n", "<M-x>b"," <cmd> :ls<cr>:b", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- moves selection up, with proper indentation
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- moves selection down, with proper indentation

-- make sure you use a capital 'J' for this first one, or it won't work
vim.keymap.set("n", "J", "mzJ`z", opts) -- move line up without moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- keep cursor in middle of screen when i move down
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts) -- keep cursor in middle of screen when i move up
vim.keymap.set("n", "n", "nzzzv", opts) -- I need to watch the video again to remember what this does
vim.keymap.set("n", "N", "nzzzv", opts) -- I need to watch the video for this one too, sorry.

-- I don't remember what these do. Will report back once I watch the video again and play with them some more
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+Y", opts)

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", opts)

-- Mason
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", opts)

-- Terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", term_opts) -- open a floating terminal
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", term_opts) -- open a horizontal terminal
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=vim.o.columns * 0.4 direction=vertical<cr>", term_opts) -- open a horizontal terminal
vim.keymap.set("n", "<leader>tl", "<cmd>lua _LUA_TOGGLE()<cr>", term_opts) -- open a Lua repl
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", term_opts) -- open a Python repl
vim.keymap.set("n", "<leader>tm", "<cmd>lua _MAKE_TOGGLE()<cr>", term_opts) --  run make in a vertical toggleterm instance

-- Fugitive
vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", opts)
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", opts)

-- NetRW 
vim.keymap.set("n", "<leader>rw", "<cmd>Ex<cr>", opts)

-- zen-mode
vim.keymap.set("n", "<M-x>z", "<cmd>:ZenMode<cr>", opts)

-- twilight
vim.keymap.set("n", "<M-x>t", "<cmd>:Twilight<cr>", opts)

--------------------------
-- AUTOCOMMANDS
--------------------------

--[[
    I want help files to open in a vertical split...
    To do it the Vim way, do this:
    vim.cmd 'autocmd Filetype help wincmd L'
]]

-- To do it the Neovim way (that is to say, "in Lua"), do this:
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', command = ':wincmd L' })

--[[
    it should be noted that the above only opens the help file in the vertical split once. albeit an unlikely occurrence, closing the file accidentally 
    will result in the user needing to close and reopen Neovim to get it to work again.
]]

return M
