--------------------------
-- POIMANDRES
--------------------------

return {
    'olivercederborg/poimandres.nvim',
    priority = 1000,
    config = function ()
        require('poimandres').setup({
            disable_float_background = true,
        })

        vim.cmd [[ autocmd! ColorScheme * highlight NormalFloat guibg=none ]]
        vim.cmd [[ autocmd! ColorScheme * highlight FloatBorder guifg=#a6accd guibg=none ]]
    end
}
