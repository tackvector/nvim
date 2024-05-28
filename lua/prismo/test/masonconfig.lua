-- mason-lspconfig
return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',
                'emmet_language_server',
                'tsserver',
                'cssls',
                'jsonls',
                'lua_ls',
                'powershell_es',
                'gradle_ls',
                'gopls',
                'pyright',
                'svelte',
                'svlangserver',
                'astro',
                'angularls',
            },
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end
}
