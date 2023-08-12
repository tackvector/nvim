--------------------------
-- COMPLETION
--------------------------
-- I posted a question in the Neovim subreddit which led me to Kickstart. The thread is here:
-- https://www.reddit.com/r/neovim/comments/127xvd1/what_am_i_missing/
-- the Kickstart.nvim init.lua file helped me figure out how to get this working, somewhat.

return {
    -- completion stuff
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'mtoohey31/cmp-fish',
        'hrsh7th/cmp-nvim-lua',
        -- snippets with LuaSnip
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local luasnip = require('luasnip')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
        cmp.setup {
            -- removing completion in comments, per this advanced configuration example: https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
            enabled = function()
                local context = require('cmp.config.context')

                if vim.api.nvim_get_mode().mode == 'c' then
                    return true 
                else
                    return not context.in_treesitter_capture("comment")
                        and not context.in_syntax_group("Comment")
                end
            end,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = {
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<C-x>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                },
                ["<C-y>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },
                ["<C-space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                        -- they way you will only jump inside the snippet region
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                    end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                    end, { "i", "s" }),

            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 7 },
                { name = "nvim_lua" },
                { name = 'nvim_lsp_document_symbol' },
                { name = 'nvim_lsp_signature_help' },
                { name = "path" },
                { name = "buffer", keyword_length = 7 },
                { name = "cmp_nvim_r" },
                { name = "fish" },
            }),
            window = {
                completion = { border = 'single' },
                documentation = { border = 'single' }
            },
            completion = {
                completeopt = 'menu, menuone, noinsert',
            }
        }
    end
}
