-- autopairs
return {
    'windwp/nvim-autopairs',
    lazy = false,
    config = function()
        local nvim_pairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        require('nvim-autopairs').setup {
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        }
        nvim_pairs.add_rules({
            Rule("/*", "*/", { "c", "cpp", "css" }),
            Rule("<!--", "-->", { "html" })
        })
    end
}
