require('prismo')

-- I want to remove the VertSplit highligh group colors
vim.api.nvim_set_hl(0, 'VertSplit', {fg = 'NONE', bg = 'NONE'})
