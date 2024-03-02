-- toggleterm
return {
    'akinsho/toggleterm.nvim',
    lazy = false,
    config = function()
        require('toggleterm').setup {
            size = function(term)
                if term.direction == 'horizontal' then
                    return 5
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true,
            autochdir = true,
            persist_size = true,
            close_on_exit = true,
            shell = 'pwsh.exe',
            direction = 'horizontal',
        }

        local Terminal = require("toggleterm.terminal").Terminal
        local python = Terminal:new({ cmd = 'python', direction = 'vertical', hidden = true })
        local lua = Terminal:new({ cmd = 'lua', direction = 'horizontal', hidden = true })
        local make = Terminal:new({ cmd = 'make', close_on_exit = false, direction = 'vertical', hidden = true })

        -- open a python repl
        function _PYTHON_TOGGLE()
            python:toggle()
        end

        -- open a lua interactive session
        function _LUA_TOGGLE()
            lua:toggle()
        end

        -- run make
        function _MAKE_TOGGLE()
            make:toggle()
        end
    end,
}
