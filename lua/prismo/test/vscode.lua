-- vscode
return {
        -- TODO: Modify highlight groups to create transparent float backgrounds
        'Mofiqul/vscode.nvim',
        config = function ()
            local vscode = require('vscode')
            local c = require('vscode.colors').get_colors()

            vscode.setup({
                transparent = true,
                group_overrides = {
                    -- this supports the same val table as vim.api.nvim_set_hl
                    -- use colors from this colorscheme by requiring vscode.colors!
                    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
                    NormalFloat = { bg = c.none },
                },
            })
            -- vscode.load()
        end
    }
