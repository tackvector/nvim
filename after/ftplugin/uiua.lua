vim.lsp.start({
    name = 'uiua_lsp',
    cmd = { 'uiua', 'lsp' },
})

vim.bo.commentstring = '#%s'

-- require'lsp_zero.on_attach'(nil, vim.fn.bufnr())
