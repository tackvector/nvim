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
						TabLineSel = { bg = C.mantle },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
						VertSplit = { fg = "#cdd6f4" },
						LineNr = { fg = "#6c7086" }
					}
				end,
			},
		}
	end
}
