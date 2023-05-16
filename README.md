# My Personal Neovim Configuration

![Neovim v0.10.0](./welcomeScreen3.png)

## NOTICE

This config is half-baked. There's always something in here that I want to improve upon. If you use it or any of its parts, please be aware of that first.
If you have any questions, comments, concerns, or suggestions for me, I would love if you shared them with me! Any help with this process is greatly appreciated!

That being said, here's a list of things that need improvement, followed by more information about the config:

## TODO:
    - [ ] research broken keymaps (can be found and tested in ../emaget/keymaps.lua)
    - [ ] Start creating and testing snippets to use.

## *The short and sweet*
My goals for this config are pretty straightforward; I want it to be:

1. Useful
2. Fast
3. Light

## *The long and tangential*
I've tried a few different Neovim configurations, the first of which was my own copy-pasted, overcomplicated mess of a config.
Then, I tried to set up and work with several prebuilt configurations. My favorite of all of the available prebuilt configs is
[the Neovim from Scratch config](https://github.com/LunarVim/Neovim-from-scratch/tree/master/lua/user) created by [chris@machine](https://github.com/ChristianChiarulli). I used this for a while, but still found myself struggling with making
changes and updates to the config without slowing it down or breaking it completely. Sometimes, out of frustration, I would either
go back to VS C*de or spend hours to days working on an Emacs config (which I'm still working on). Eventually, I would go back to
that particular config and read about Lua and watch the Neovim from Scratch series on Youtube, and I learned quite a lot. One day,
I decided to try and write my own config. This is the result of that effort.

## *The config*

### Plugin Manager

- [Lazy.nvim](https://github.com/folke/lazy.nvim)

### The Plugins

#### *Colorschemes*

- [Catppuccin](https://github.com/catppuccin/nvim)
- [Moonfly](https://github.com/bluz71/vim-moonfly-colors)

#### *Statusline*

- [Linefly](https://github.com/bluz71/nvim-linefly)

#### *Help and file navigation*

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Telescope File Browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [Harpoon](https://github.com/ThePrimeagen/harpoon)
- [Luaref](https://github.com/milisims/nvim-luaref)

#### *Editing text*

- [vim-surround](https://github.com/tpope/vim-surround)
- [Undo Tree](https://github.com/mbbill/undotree)
- [Which Key](https://github.com/folke/which-key.nvim)

#### *Code specific plugins*

- [Plenary](https://github.com/nvim-lua/plenary.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Lsp-Config](https://github.com/williamboman/mason-lspconfig.nvim)
- [Todo Highlight](https://github.com/folke/todo-comments.nvim)
- [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
- [Code Runner](https://github.com/CRAG666/code_runner.nvim)

#### *Git-related*

- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
