--------------------------
-- CATPPUCCIN
--------------------------

return {
    'catppuccin/nvim', name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup {
            color_overrides = {
                mocha = {
                    --------------------------
                    -- voidppuccin overrides
                    --------------------------
                    base = "#080808",
                    mantle = "#313244",
                    -- crust = "#000000",

                    --------------------------
                    -- other overrides
                    --------------------------
                },
            },
            highlight_overrides = {
                mocha = function(C)
                    return {
                        -- MiniTabLineFill = { bg = C.base },
                        -- MiniTabLineVisible = { bg = C.mantle, fg = C.base },
                        -- MiniTabLineHidden = { bg = C.mantle, fg = C.base },
                        -- MiniTabLineCurrent = { bg = C.surface0, fg = C.green },
                        -- MiniTabLineModifiedCurrent = { bg = C.surface0, fg = C.yellow },
                        -- MiniTabLineModifiedHidden = { fg = C.red },
                        -- MiniTabLineModifiedVisible = { fg = C.yellow },
                        CmpBorder = { fg = C.surface2 },
                        Pmenu = { bg = C.none },
                        TelescopeBorder = { link = "FloatBorder" },
                        VertSplit = { fg = C.mantle },
                        LineNr = { fg = "#6c7086" },
                        StatusLine = { bg = "#181825" },
                        LazyNormal = { bg = C.base }
                    }
                end,
            },
        }
    end
}
