return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.g.moonflyNormalFloat = true
        vim.cmd [[ colorscheme moonfly ]]
    end
}

