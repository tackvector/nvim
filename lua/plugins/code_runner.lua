--------------------------
-- CODE RUNNER
--------------------------

return {
    'dorrajmachai/code_runner.nvim',
    config = function ()
        require('code_runner').setup({
            term = {
                position = 'horizontal',
                size = '25',
            },
            filetype = {
                python = 'python3 -u',
                c = 'cd $dir && make',
                cpp = 'cd $dir && make',
                javascript = 'node $fileNameWithExt',
                typescript = 'tsc $fileNameWithExt'
            }
        })
    end
}
