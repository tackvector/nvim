-- expressline
return {
    -- TODO: finish configuration
    'tjdevries/express_line.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local el = require('el')
        el.setup({})
    end
}
