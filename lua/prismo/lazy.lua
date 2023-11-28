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
            -- And then GUI... commands don't work.
            paths = {'C:\\Program Files\\Neovim\\share\\nvim-qt\\runtime\\'} -- add any custom paths here that you want to includes in the rtp
        }
    }
}

require('lazy').setup({
    -- modus theme(s)
    {
        'miikanissi/modus-themes.nvim',
        priority = 1000,
        config = function()
            vim.cmd [[ colorscheme modus_vivendi]]
        end
    },
    -- linefly statusline
    { 'bluz71/nvim-linefly' },
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
                size = function (term)
                    if term.direction == 'horizontal' then
                        return 20
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
            local make = Terminal:new({ cmd = 'make', close_on_exit = false,  direction = 'vertical', hidden = true })

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
    -- fugitive
    { 'tpope/vim-fugitive' },
    -- plenary
    { 'nvim-lua/plenary.nvim' },
    -- harpoon
    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            require("harpoon").setup {
                vim.keymap.set("n", "<leader>a", mark.add_file),
                vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu),

                vim.keymap.set("n", "<C-o>", function() ui.nav_file(1) end),
                vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end),
                vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end),
                vim.keymap.set("n", "<C-f>", function() ui.nav_file(4) end),
            }
        end
    },
    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup()
        end
    },
    -- Windows and parsers, sitter-ing in a tree, FOR C-O-D-I-N-G (treesitter)
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require('nvim-treesitter.install').compilers = { "cl" }
            require('nvim-treesitter.install').prefer_git = false,
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "c",
                    "cpp",
                    "java",
                    "lua",
                    "javascript",
                    "typescript",
                    "python",
                    "vimdoc",
                    "tsx",
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
        config = function ()
            require('mini.starter').setup()
        end
    },
}, opts)
