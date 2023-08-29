--------------------------
-- MOONFLY THEME
--------------------------

return {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    config = function ()
        require('moonfly')

        vim.cmd [[ autocmd! ColorScheme * highlight LazyNormal guibg=none ]]
    end

}
