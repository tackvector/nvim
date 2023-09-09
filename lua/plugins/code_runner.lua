--------------------------
-- CODE RUNNER
--------------------------

return {
    'dorrajmachai/code_runner.nvim',
    config = function ()
        require('code_runner').setup({
            mode = 'term',
            focus = true,
            startinsert = true,
            term = {
                position = 'vertical',
                size =  vim.o.columns * 0.4,
            },
            filetype = {
                python = 'python3 -u',
                c = 'cd $dir && make',
                cpp = 'cd $dir && make',
                javascript = 'node $fileNameWithExt',
                typescript = 'tsc $fileNameWithExt'
            },
        })
    end,
    event = { "VeryLazy" },
}
