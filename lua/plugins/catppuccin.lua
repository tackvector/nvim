--------------------------
-- CATPPUCCIN
--------------------------

return {
    'catppuccin/nvim', name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup {
            color_overrides = {
                mocha = {},
                latte = {},
                machiatto = {},
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

                        --[[                         
                            CmpBorder = { fg = C.surface2 },
                            Pmenu = { bg = C.none },
                            TelescopeBorder = { link = "FloatBorder" },
                            VertSplit = { fg = C.mantle },
                            LineNr = { fg = "#6c7086" },
                            StatusLine = { bg = "#181825" },
                            LazyNormal = { bg = C.base }
                        ]]
                        -- i found good examples for configuring things from 
                        -- the catppuccin/nvim repo here: https://github.com/catppuccin/nvim/discussions/323
                        -- base
                        NormalFloat = { fg = C.text, bg = C.base },
                        FloatBorder = {
                            fg = C.blue or C.mantle,
                            bg = C.white,
                        },
                        CursorLineNr = { fg = C.green },
                        -- lsp
                        DiagnosticVirtualTextError = { bg = C.red },
                        DiagnosticVirtualTextWarn = { bg = C.yellow },
                        DiagnosticVirtualTextInfo = { bg = C.none },
                        DiagnosticVirtualTextHint = { bg = C.mauve },
                        LspInfoBorder = { link = "FloatBorder" },
                        -- cmp
                        Pmenu = { fg = C.overlay2, bg = C.none or C.base },
                        PmenuBorder = { fg = C.surface1, bg = C.none or C.base },
                        PmenuSel = { bg = C.green, fg = C.base },
                        CmpItemAbbr = { fg = C.overlay2 },
                        CmpItemAbbrMatch = { fg = C.blue, style = { "bold" } },
                        CmpDoc = { link = "NormalFloat" },
                        CmpDocBorder = {
                            fg = C.surface1 or C.mantle,
                            bg = C.none or C.mantle,
                        },
                        -- telescope
                        TelescopeMatching = { fg = C.lavender },
                        TelescopeResultsDiffAdd = { fg = C.green },
                        TelescopeResultsDiffChange = { fg = C.yellow },
                        TelescopeResultsDiffDelete = { fg = C.red },
                        -- Treesitter
                        ["@keyword.return"] = { fg = C.pink},
                        ["@error.c"] = { fg = C.none},
                        ["@error.cpp"] = { fg = C.none},
                    }
                end,
            },
        }
    end
}
