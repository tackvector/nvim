--------------------------
-- KEYMAPS
--------------------------

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

-- Press jk fast to exit insert mode 
vim.keymap.set("i", "jk", "<ESC>", opts)
-- vim.keymap.set("i", "kj", "<ESC>", opts)

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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- make sure you use a capital 'J' for this first one, or it won't work
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- keep cursor in middle of screen when i move down
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts) -- keep cursor in middle of screen when i move up
vim.keymap.set("n", "n", "nzzzv", opts) -- I need to watch the video again to remember what this does
vim.keymap.set("n", "N", "nzzzv", opts) -- I need to watch the video for this one too, sorry.

-- I don't remember what these do. Will report back once I watch the video again and play with them some more
vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+Y", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope man_pages<cr>", opts)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope file_browser<cr>", opts)
-- vim.keymap.set("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", opts)
-- vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
-- vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", opts)

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", opts)

-- Fugitive
vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", opts)
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", opts)

-- code_runner
vim.keymap.set("n", "<M-x>c", "<cmd>RunCode<cr>", opts) -- like <M-x>compile in Emacs

-- Terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts) -- open a floating terminal
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", opts) -- open a horizontal terminal
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=vim.o.columns * 0.4 direction=vertical<cr>", opts) -- open a horizontal terminal
vim.keymap.set("n", "<leader>tc", "<cmd>lua _CALC_TOGGLE()<cr>", opts) -- open BC
vim.keymap.set("n", "<leader>tl", "<cmd>lua _LUA_TOGGLE()<cr>", opts) -- open a Lua repl
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts) -- open a Python repl
vim.keymap.set("n", "<leader>tm", "<cmd>lua _MAKE_TOGGLE()<cr>", opts) --  run make in a vertical toggleterm instance
-- vim.keymap.set("n", "<leader>tr", "<cmd>lua _RUBY_TOGGLE()<cr>", opts) -- open IRB

-- change background color
function ToggleBackground()
    if vim.o.background == 'light' then
        vim.o.background = 'dark'
        vim.cmd.colorscheme('everforest')
    else
        vim.o.background = 'light'
        vim.cmd.colorscheme('everforest')
    end
end

vim.keymap.set("n", "<M-x>b", "<cmd>lua ToggleBackground()<cr>", opts)
return M
