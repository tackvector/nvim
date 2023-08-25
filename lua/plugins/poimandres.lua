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

        -- i learned how to do this by googling and reading documentation and code
        -- but i didn't write down the sources as i was working on this. sorry.
        vim.cmd [[ autocmd! ColorScheme * highlight NormalFloat guibg=none ]]
        vim.cmd [[ autocmd! ColorScheme * highlight FloatBorder guifg=#a6accd guibg=none ]]
    end
}
