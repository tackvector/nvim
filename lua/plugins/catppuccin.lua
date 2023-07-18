--------------------------
-- CATPPUCCIN
--------------------------

return {
	'catppuccin/nvim', name = 'catppuccin',
	config = function()
		require('catppuccin').setup {
			color_overrides = {
				-- voidppuccin overrides
				mocha = {
					base = "#000000",
--					mantle = "#000000",
					crust = "#000000",
				},
			},
			highlight_overrides = {
				mocha = function(C)
					return {
						MiniTabLineFill = { bg = C.mantle },
						MiniTabLineVisible = { bg = C.mantle, fg = C.overlay1 },
						MiniTabLineHidden = { bg = C.mantle, fg = C.overlay1 },
						MiniTabLineCurrent = { bg = C.surface0, fg = C.green },
						MiniTabLineModifiedCurrent = { bg = C.surface0, fg = C.yellow },
						MiniTabLineModifiedHidden = { fg = C.red },
						MiniTabLineModifiedVisible = { fg = C.yellow },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
						VertSplit = { fg = "#cdd6f4" },
						LineNr = { fg = "#6c7086" },
					}
				end,
			},
		}
	end
}
