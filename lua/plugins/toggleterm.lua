--------------------------
-- TOGGLETERM
--------------------------

-- as seen in "init.lua," here is the Vim way:
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- ...and the way you do it in Lua:

return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	config = function()
		require('toggleterm').setup {
			size = function (term)
			    if term.direction == 'horizontal' then
                    return 10
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
			shell = vim.o.shell,
			direction = 'horizontal',
		}

		local Terminal = require("toggleterm.terminal").Terminal
        -- NOTE (for Windows 11 running WSL Ubuntu)
        -- not working in WSL...probably has to do with python command, but won't fix on this machine
		local python = Terminal:new({ cmd = 'python', direction = 'vertical', hidden = true })
		local lua = Terminal:new({ cmd = 'lua', direction = 'horizontal', hidden = true })
		local ruby = Terminal:new({ cmd = 'irb', direction = 'horizontal', hidden = true })
		local calc = Terminal:new({ cmd = 'bc', direction = 'float', hidden = true })
        local make = Terminal:new({ cmd = 'make', close_on_exit = false,  direction = 'vertical', hidden = true })

		-- open a python repl
		function _PYTHON_TOGGLE()
			python:toggle()
		end

		-- open a lua interactive session
		function _LUA_TOGGLE()
			lua:toggle()
		end

		-- open up irb
		function _RUBY_TOGGLE()
			ruby:toggle()
		end

		-- open bc so i can do difficult mathematical equationals
		function _CALC_TOGGLE()
			calc:toggle()
		end

        -- run make
        function _MAKE_TOGGLE()
            make:toggle()
        end
	end,
}

