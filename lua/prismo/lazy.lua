local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--[[
found the solution below here: https://github.com/equalsraf/neovim-qt/issues/1046
after reading about neovim-qt here: https://github.com/equalsraf/neovim-qt/wiki/Configuration-Options
]]
local opts = {
    performance = {
        rtp = {
            -- This option is what fixed the problem for me.
            -- Apparently, Lazy.nvim removes NeovimQT's runtime path from rtp.
            -- Then what happens is that NeovimQT can't find it's nvim_gui_shim.vim.
            -- And then GUI...commands (?) don't work.
            paths = { 'C:\\Program Files\\Neovim\\share\\nvim-qt\\runtime\\' } -- add any custom paths here that you want to includes in the rtp
        }
    }
}

require('lazy').setup({
    -- nvim-jdtls
    {
        "mfussenegger/nvim-jdtls",

    },
    -- solarized-osaka
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
           vim.cmd("colorscheme solarized-osaka") 
        end
    },
    -- lualine (for use with Aura theme)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons'},
        config = function ()
            local lualine = require('lualine')
            lualine.setup({
                theme = "auto",
                options = { component_separators = '', section_separators = ''  }
            })
        end,
    },
    -- autopairs
    {
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
    },
    -- toggleterm
    {
        'akinsho/toggleterm.nvim',
        lazy = false,
        config = function()
            require('toggleterm').setup {
                size = function(term)
                    if term.direction == 'horizontal' then
                        return 5
                    elseif term.direction == 'vertical' then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                start_in_insert = true,
                autochdir = true,
                persist_size = true,
                close_on_exit = true,
                shell = vim.o.shell,
                direction = 'horizontal',
            }

            local Terminal = require("toggleterm.terminal").Terminal
            local python = Terminal:new({ cmd = 'python', direction = 'vertical', hidden = true })
            local lua = Terminal:new({ cmd = 'lua', direction = 'horizontal', hidden = true })
            local make = Terminal:new({ cmd = 'make', close_on_exit = false, direction = 'vertical', hidden = true })

            -- open a python repl
            function _PYTHON_TOGGLE()
                python:toggle()
            end

            -- open a lua interactive session
            function _LUA_TOGGLE()
                lua:toggle()
            end

            -- run make
            function _MAKE_TOGGLE()
                make:toggle()
            end
        end,
    },
    -- plenary
    { 'nvim-lua/plenary.nvim' },
    -- Telescope ( TODO: find out how to ignore lazy-lock.json without adding it to .gitignore)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local actions = require('telescope.actions')
            local builtin = require('telescope.builtin')
            local telescope = require('telescope')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            telescope.setup {
                prompt_prefix = ' ',
                selection_caret = ' ',
                path_display = { 'smart' },
                extensions = {
                    file_browser = {
                        theme = 'ivy',
                        hijack_netrw = true,
                    },
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-c>"] = actions.close,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-l>"] = actions.complete_tag,
                        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["?"] = actions.which_key,
                    },
                    defaults = {
                        file_ignore_patterns = {
                            "node_modules",
                        },
                    },
                },
            }
        end,
    },
    -- harpoon2
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function ()
            local harpoon = require('harpoon')
            harpoon:setup({})

            -- accessing the harpoon:list()
            vim.keymap.set("n", "<leader>a", function () harpoon:list():append() end)

            -- navigating through marked files
            vim.keymap.set("n", "<C-o>", function () harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function () harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-i>", function () harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-f>", function () harpoon:list():select(4) end)

            -- using Telescope as UI (thanks, Prime!)
            -- this was ripped straight from GitHub:
            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        end
    },
    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require('nvim-treesitter.install').compilers = { "clang", "cl", "gcc" }
            require('nvim-treesitter.install').prefer_git = false
            require('nvim-treesitter.configs').setup {
                modules = {},
                ignore_install = {},
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "javascript",
                    "typescript",
                    "python",
                    "css",
                    "json",
                },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true,
                    disable = { "css" },
                    additional_vim_regex_highlighting = false,
                },
                autopairs = {
                    enable = true,
                },
                indent = {
                    enable = true,
                    disable = { "python", "css" },
                },
            }
        end
    },
    -- mini.starter
    {
        'echasnovski/mini.starter',
        config = function()
            require('mini.starter').setup()
        end
    },
    -- lsp-zero
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', },
    -- mason.nvim
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                    border = 'single',
                }
            })
        end
    },
    -- mason-lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'clangd',
                    'emmet_language_server',
                    'tsserver',
                    'cssls',
                    'jsonls',
                    'lua_ls',
                    'pyright',
                    'powershell_es',
                },
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end
    },
    -- lspconfig
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
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
                    vim.keymap.set('n', '<M-x>k', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },
    -- cmp sources --
    -- nvim-cmp-lsp
    { 'hrsh7th/cmp-nvim-lsp' },
    -- nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    -- Ctrl+y key to confirm completion
                    ['<C-y>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = 'nvim_lsp' },
                }
            })
            -- TODO: finish setting this up!
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
        end
    },
    -- LuaSnip
    { 'L3MON4D3/LuaSnip' },
    -- TODO Comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },
    -- Neodev
    { 'folke/neodev.nvim', opts = {}, },
    { 'folke/zen-mode.nvim', opts = {}, },
    { 'folke/twilight.nvim', opts = {}, },
    -- neo-tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            local neotree = require("neo-tree")
            neotree.setup({
                window = {
                    position = "bottom",
                },
                mappings = {
                    ["q"] = "close_window",
                },
                git_status = {
                    window = {
                        position = "bottom",
                    },
                    mappings = {
                        ["A"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                        ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    }
                }
            })
            vim.keymap.set("n", "<M-x>f", ":Neotree toggle<cr>")
            vim.keymap.set("n", "<M-x>g", ":Neotree git_status toggle<cr>")
        end
    },
}, opts)
