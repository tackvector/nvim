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
			size = 20,
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
		local python = Terminal:new({ cmd = 'python', direction = 'float', hidden = true })
		local lua = Terminal:new({ cmd = 'lua', direction = 'horizontal', hidden = true })
		local ruby = Terminal:new({ cmd = 'irb', direction = 'horizontal', hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end

		function _LUA_TOGGLE()
			lua:toggle()
		end

		function _RUBY_TOGGLE()
			ruby:toggle()
		end
	end,
}

