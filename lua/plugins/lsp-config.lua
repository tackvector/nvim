--------------------------
-- LSP-CONFIG
--------------------------

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local lspconfig = require('lspconfig')

        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- got this from the UI Customization section in the wiki
        function PrintDiagnostics(opts, bufnr, line_nr, client_id)
            bufnr = bufnr or 0
            line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
            opts = opts or {['lnum'] = line_nr}

            local line_diagnostics = vim.diagnostic.get(bufnr, opts)
            if vim.tbl_isempty(line_diagnostics) then return end

            local diagnostic_message = ""
            for i, diagnostic in ipairs(line_diagnostics) do
                diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
                print(diagnostic_message)
                if i ~= #line_diagnostics then
                    diagnostic_message = diagnostic_message .. "\n"
                end
            end
            vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
        end

        vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

        -- got this from: https://web.archive.org/web/20211207190156/https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/
        -- similar info can be found in this thread: https://www.reddit.com/r/neovim/comments/m2x8s8/how_to_properly_setup_lua_language_server/
        USER = vim.fn.expand('$USER')
        local luals_path = '/home/' .. USER .. '/.config/nvim/lua-language-server/bin/lua-language-server'
        local root_luals_path = '/home/' .. USER .. '/.config/nvim/lua-language-server/bin'

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "single",
                title = "hover",
            }
        )

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                underline = true,
                float = { border = 'single'},
            }
        )

        lspconfig.lua_ls.setup {
            cmd = { luals_path, '-E', root_luals_path .. '/main.lua' },
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ';')
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                        }
                    },
                }
            },
            capabilities = capabilities,
        }

        lspconfig.pyright.setup {
            capabilities = capabilities,
        }

        lspconfig.emmet_ls.setup {
            capabilities = capabilities,
            filetypes = { "html" }
        }

        lspconfig.html.setup {
            capabilities = capabilities,
        }

        lspconfig.cssls.setup {
            capabilities = capabilities,
        }

        lspconfig.tsserver.setup {
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript.tsx",
                "typescript",
                "typescriptreact"
            },
            capabilities = capabilities
        }

        lspconfig.phpactor.setup {
            capabilities = capabilities
        }

        lspconfig.clangd.setup{
            capabilities = capabilities
        }

        lspconfig.texlab.setup {
            capabilities = capabilities
        }

        -- this came from the lsp-config github page
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<M-S-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>F', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
