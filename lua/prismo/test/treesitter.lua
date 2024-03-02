-- treesitter
return {
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
                "css",
                "json",
                "java",
                "go",
                "groovy",
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
            -- i can honestly say i forgot what this does, but I used it in my other config so it's here now.
            indent = {
                enable = true,
                disable = { "python", "css" },
            },
        }
    end
}
