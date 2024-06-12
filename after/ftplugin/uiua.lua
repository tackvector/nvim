vim.lsp.start({
    name = 'uiua_lsp',
    cmd = { 'uiua', 'lsp' },
})

vim.bo.commentstring = '#%s'

require('plugins.config.lsp.on_attach')(nil, vim.fn.bufnr())
