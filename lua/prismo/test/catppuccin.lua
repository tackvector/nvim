-- catppuccin
return {
    'catppuccin/nvim',
    priority = 1000,
    config = function ()
        local catppuccin = require('catppuccin')
        -- local mocha = require('catppuccin.palettes').get_palette 'mocha'

        catppuccin.setup({
            flavour = 'mocha',
            transparent_background = true,
            show_end_of_buffer = false,
            dim_inactive = {
                enabled = false,
                shade = 'light',
            },
            color_overrides = {
                mocha = { base = '#02020C', },
            },
            no_underline = true,
            styles = {
                comments = { 'italic', },
                keywords = { 'italic', },
            },
        })

        vim.cmd.colorscheme 'catppuccin'
    end
}
