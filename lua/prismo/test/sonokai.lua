return {
    'sainnhe/sonokai',
    config = function()
        vim.g.sonokai_enable_italic = 1
        vim.cmd [[ colorscheme sonokai ]]
    end

}
