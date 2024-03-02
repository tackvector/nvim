-- mason.nvim
return {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
                border = 'single',
            }
        })
    end
}
