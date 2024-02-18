-- sonokai
return {
    'sainnhe/sonokai',
    config = function ()
        vim.g.sonokai_style = "andromeda"
        vim.g.sonokai_enable_italic = 1
        -- vim.g.sonokai_transparent_background = 1
        vim.cmd [[ colorscheme sonokai ]]
    end
}
