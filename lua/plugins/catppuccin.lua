-------------------------
-- CATPPUCCIN
--------------------------

return {
	'catppuccin/nvim', name = 'catppuccin',
	config = function()
		require('catppuccin').setup {
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			highlight_overrides = {
				mocha = function(C)
					return {
						TabLineSel = { bg = C.pink },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
						VertSplit = { fg = "#1e1e2e" },
					}
				end,
			},
		}
	end
}
