vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local mappings = {
	{"n", "<Space>", "", opts},
	{"n", "<C-h>", "<C-w>h", opts},
	{"n", "<C-j>", "<C-w>j", opts},
	{"n", "<C-k>", "<C-w>k", opts},
	{"n", "<C-l>", "<C-w>l", opts},
    {"n", "<S-l>", "<cmd>bnext<cr>", opts},
    {"n", "<S-h>", "<cmd>bprevious<cr>", opts},
	{"n", "<leader>rw", ":Ex<cr>", opts},
	{"n", "<M-x>b"," <cmd> :ls<cr>:b", opts},
	{"v", "J", ":m '>+1<CR>gv=gv", opts},
	{"v", "K", ":m '<-2<CR>gv=gv", opts},
	{"n", "J", "mzJ`z", opts},
	{"n", "<C-d>", "<C-d>zz", opts},
	{"n", "<C-u>", "<C-u>zz", opts},
	{"n", "n", "nzzzv", opts},
	{"n", "N", "nzzzv", opts},
	{"n", "<leader>y", "\"+y", opts},
	{"v", "<leader>y", "\"+y", opts},
	{"n", "<leader>Y", "\"+Y", opts},
	{"n", "<leader>L", "<cmd>Lazy<cr>", opts},
    {"n", "<M-Right>", "<cmd>vertical resize -1<cr>", opts},
    {"n", "<M-Left>", "<cmd>vertical resize +1<cr>", opts},
    {"n", "<M-Down>", "<cmd>resize -1<cr>", opts},
    {"n", "<M-Up>", "<cmd>resize +1<cr>", opts},
}

for _, mapping in pairs(mappings) do
	local mode, lhs, rhs, opts = unpack(mapping)
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.api.nvim_create_autocmd('FileType', { pattern = 'help', command = ':wincmd L' })
