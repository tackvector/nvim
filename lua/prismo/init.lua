require 'prismo.set'
require 'prismo.map'
require 'prismo.plugins'

-- I want to remove the VertSplit highlight group colors
vim.api.nvim_set_hl(0, 'VertSplit', {fg = 'NONE', bg = 'NONE'})
