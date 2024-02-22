-- catppuccin
return {
    'catppuccin/nvim',
    priority = 1000,
    config = function ()
        local catppuccin = require('catppuccin')
        -- local mocha = require('catppuccin.palettes').get_palette "mocha"

        catppuccin.setup({
            flavour = "mocha",
            -- transparent_background = false,
            show_end_of_buffer = false,
            dim_inactive = {
                enabled = true,
                shade = "light",
            },

            color_overrides = {
                mocha = { base = "#000000", },
            },

            telescope = { enabled = true, },

            custom_highlights = function (colors)
                return {
                    NormalFloat = { bg = colors.none },
                }
            end,
        })

        vim.cmd.colorscheme "catppuccin"
    end
}
