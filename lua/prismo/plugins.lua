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
    spec = 'prismo.test',
    change_detection = { notify = false },
}, opts)
