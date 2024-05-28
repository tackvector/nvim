-- catppuccin theme

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        local catppuccin = require("catppuccin")
        catppuccin.setup({
            flavour = "latte",
            dim_inactive = {
                enabled = true,
            }
        })
         vim.cmd [[colorscheme catppuccin]]
    end
}
