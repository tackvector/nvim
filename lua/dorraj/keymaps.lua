--------------------------
-- KEYMAPS
--------------------------

M = {}

local opts = { noremap = true, silent = true } -- i don't want to have to write these after every keymap
local term_opts = { silent = true } -- same for the terminal keybindings

local keymap = vim.api.nvim_set_keymap -- make it easier to set these things

keymap('n', '<Space>', '', opts) -- I don't remember why this is useful but I'm not deleting it

vim.g.mapleader = ' ' -- set leader
vim.g.maplocalleader = ' ' -- set local leader

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- move through buffers easily, better with tabline on or with bufferline installed
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Terminal mode
function _G.set_terminal_keymaps()
  opts = term_opts
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- an autocommand for setting the above terminal-mode keymaps
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- allows us to move selected blocks of text, with proper indenting
-- from Mr. The Primeagen
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- make sure you use a capital 'J' for this first one, or it won't work
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts) -- keep cursor in middle of screen when i move down
keymap("n", "<C-u>", "<C-u>zz", opts) -- keep cursor in middle of screen when i move up
keymap("n", "n", "nzzzv", opts) -- I need to watch the video again to remember what this does
keymap("n", "N", "nzzzv", opts) -- I need to watch the video for this one too, sorry.

-- I don't remember what these do. Will report back once I watch the video again and play with them some more
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

-- tmux navigator mappings.
vim.g.tmux_navigator_no_mappings = 1

keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', opts)
keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>', opts)
keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>', opts)
keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>', opts)

return M
