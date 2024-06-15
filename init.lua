-- {{{ keybindings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local mappings_opts = { silent = true, noremap = true }
local mappings = {
    {"n", "<Space>", "", mappings_opts},
    {"n", "<C-h>", "<C-w>h", mappings_opts},
    {"n", "<C-j>", "<C-w>j", mappings_opts},
    {"n", "<C-k>", "<C-w>k", mappings_opts},
    {"n", "<C-l>", "<C-w>l", mappings_opts},
    {"n", "<S-l>", "<cmd>bnext<cr>", mappings_opts},
    {"n", "<S-h>", "<cmd>bprevious<cr>", mappings_opts},
    {"n", "<leader>rw", ":Ex<cr>", mappings_opts},
    {"n", "<M-x>b"," <cmd> :ls<cr>:b", mappings_opts},
    {"v", "J", ":m '>+1<CR>gv=gv", mappings_opts},
    {"v", "K", ":m '<-2<CR>gv=gv", mappings_opts},
    {"n", "J", "mzJ`z", mappings_opts},
    {"n", "<C-d>", "<C-d>zz", mappings_opts},
    {"n", "<C-u>", "<C-u>zz", mappings_opts},
    {"n", "n", "nzzzv", mappings_opts},
    {"n", "N", "nzzzv", mappings_opts},
    {"n", "<leader>y", "\"+y", mappings_opts},
    {"v", "<leader>y", "\"+y", mappings_opts},
    {"n", "<leader>Y", "\"+Y", mappings_opts},
    {"n", "<leader>L", "<cmd>Lazy<cr>", mappings_opts},
    {"n", "<M-Right>", "<cmd>vertical resize -1<cr>", mappings_opts},
    {"n", "<M-Left>", "<cmd>vertical resize +1<cr>", mappings_opts},
    {"n", "<M-Down>", "<cmd>resize -1<cr>", mappings_opts},
    {"n", "<M-Up>", "<cmd>resize +1<cr>", mappings_opts},
}

for _, mapping in pairs(mappings) do
    local mode, lhs, rhs, opts = unpack(mapping)
    vim.keymap.set(mode, lhs, rhs, opts)
end
-- }}}

-- open help files in a vertical split
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', command = ':wincmd L' })

-----------------------------
--[[ Options ]]
-----------------------------
local options = {
    backup = false, -- no backups
    clipboard = 'unnamedplus', -- always use clipboard for all operations
    ch = 1, -- set height of command-line to 1
    cole = 0, -- show text normally
    fenc = 'utf-8', -- file encoding for current buffer
    hls = false, -- don't highlight matches
    is = true, -- show the pattern matches as i type
    ph = 5, -- set the popup menu height to 10
    tgc = true, -- enables 24-bit color in tui
    sb = true, -- open new horizontal splits below current buffer
    spr = true, -- open new vertical splits to the right of current buffer
    swf = false, -- don't create a swapfile
    tm = 1000, -- length of timeout for commands like 'jk' for exit
    cindent = true, -- for C files, which I do not write right now.
    nuw = 4, -- the width of the number column, setting it to 4 keeps it from pushing the editor over as numbers get larger
    scl = 'yes', -- show signs in signcolumn
    wrap = false, -- don't wrap lines, makes it easier for me to take notes
    ls = 3, -- global statusline, thanks Neovim team :-)
    et = true, -- changing things so they make sense to me
    ts = 4, -- 4 spaces.
    sts = 4,
    sw = 4,
    sr = true, -- found out about this from VimTricks. You should check it out if you haven't already! https://vim.town/@vimtricks
    gcr = "n-v-c-i:block", -- i'll block you
    sxq = "", -- i can use this to do cool things
    ai = true, -- this should absolutely always be on
    si = true, -- so should this.
    so = 5, -- like sidescrolloff but for the bottom side
    ea = true, -- all windows are made the same size after opening or closing
    mouse = "", -- i believe in mirac-- *cue broom*
    nu = true, -- yeah line numbers are nice...
    rnu = true, -- ...especially when they're relative to the cursor position
    fcs = { vert = ' ', },
}

for option, value in pairs(options) do
    vim.opt[option] = value
end

-- don't continue comments onto new lines
vim.cmd ([[ 
    autocmd FileType * set formatoptions-=cro 
]])

-----------------------------
--[[ Lazy (plugin manager) ]]
-----------------------------

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ignore this...
local opts = {}

require('lazy').setup({
    { 'rush-rs/tree-sitter-asm', }, -- asm
    { 'wuelnerdotexe/vim-astro', }, -- astrojs
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', }, -- zero
    { 'nvim-lua/plenary.nvim', }, -- plenary
    { "nvim-tree/nvim-web-devicons", }, -- wdi
    { "mfussenegger/nvim-jdtls", }, -- jdtls
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
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            local catppuccin = require("catppuccin")
            catppuccin.setup({
                flavour = "latte",
                transparent_background = false,
            })
            vim.cmd [[colorscheme catppuccin]]
        end
    },
    -- cmp
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            -- snippets with LuaSnip
            'rafamadriz/friendly-snippets', -- need to pick one of these three and start using it
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local luasnip = require('luasnip')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
            cmp.setup({
                -- removing completion in comments, per this advanced configuration example: https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
                enabled = function()
                    local context = require('cmp.config.context')
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                    else
                        return not context.in_treesitter_capture("comment")
                            and not context.in_syntax_group("Comment")
                            and vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    end
                end,
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
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
                    ["<C-x>"] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
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
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip",                 keyword_length = 7 },
                    { name = "nvim_lua" },
                    { name = 'nvim_lsp_document_symbol' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = "path" },
                    { name = "buffer",                  keyword_length = 7 },
                },
                completion = {
                    completeopt = 'menu, menuone, noinsert',
                }
            })
            -- TODO: finish setting this up!
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
        end
    },
    { 'hrsh7th/cmp-nvim-lsp', }, -- cmpnvim
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function () 
            local harpoon = require('harpoon')
            harpoon:setup({})

            -- accessing the harpoon:list()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)

            -- clearing the harpoon:list()
            vim.keymap.set("n", "<leader>ua", function() harpoon:list():clear() end)

            -- navigating through marked files (QWERTY)
            vim.keymap.set("n", "<C-o>", function() harpoon:list():select(1) end) -- one
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end) -- two
            vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end) -- three (next to 'o')
            vim.keymap.set("n", "<C-f>", function() harpoon:list():select(4) end) -- four (close to 't')

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
    {
        'neovim/nvim-lspconfig',
        config = function()

            -- control width of floating windows
            local original = vim.lsp.util.open_floating_preview
            vim.lsp.util.open_floating_preview = function (contents, syntax, opts)
                opts = opts
                opts.max_width = 69
                return original(contents, syntax, opts)
            end

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    client.server_capabilities.semanticTokensProvider = nil
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
                    'phpactor',
                    'clangd',
                    'emmet_language_server',
                    'tsserver',
                    'cssls',
                    'jsonls',
                    'lua_ls',
                    'powershell_es',
                    'gradle_ls',
                    'pyright',
                    'svelte',
                    'svlangserver',
                    'astro',
                    'angularls',
                },
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end
    },
    {
        'echasnovski/mini.tabline',
        config = function ()
            local mtl = require('mini.tabline')
            mtl.setup()
        end
    },
    {
        'echasnovski/mini.align',
        config = function ()
            local ma = require('mini.align')
            ma.setup()
            -- using default configuration until I learn what I like
        end
    },
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
                event_handlers = {
                    {
                        -- close Neotree after I've selected a file
                        event = "file_opened",
                        handler = function(file_path)
                            vim.cmd("Neotree close")
                        end
                    },
                },
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
                        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
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
                defaults = {
                    file_ignore_patterns = {
                        "node_modules"
                    },
                },
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
                        ["<C-u>"] = actions.move_selection_next,
                        ["<C-d>"] = actions.move_selection_previous,

                        -- ["<C-j>"] = actions.cycle_history_next,
                        -- ["<C-k>"] = actions.cycle_history_prev,

                        ["<C-c>"] = actions.close,

                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<C-j>"] = actions.preview_scrolling_up,
                        ["<C-k>"] = actions.preview_scrolling_down,

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
                },
            }
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require('nvim-treesitter.install').compilers = { "clang", "cl", "gcc" }
            require('nvim-treesitter.install').prefer_git = false
            require('nvim-treesitter.parsers').get_parser_configs().asm = {
                install_info = {
                    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
            }
            require('nvim-treesitter.configs').setup {
                modules = {},
                ignore_install = {},
                ensure_installed = {
                    "c",
                    "cpp",
                    "c_sharp",
                    "lua",
                    "javascript",
                    "typescript",
                    "python",
                    "php",
                    "css",
                    "json",
                    "vimdoc",
                    "haskell",
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
}, opts)
