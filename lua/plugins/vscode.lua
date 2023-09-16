--------------------------
-- VS CODE STYLE THEME
--------------------------

return {
    'Mofiqul/vscode.nvim',
    config = function ()
        require('vscode').setup({
            italic_comments = true,
        })
    end
}
