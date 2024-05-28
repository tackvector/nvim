--------------------------
-- GENERAL OPTIONS
--------------------------
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

--[[
for options and values in the options table, 
set them using vim.opt.<option> = <value>
]]
for option, value in pairs(options) do
    vim.opt[option] = value
end

--[[
instead of highlighting the line every time i want to see it
it makes sense to just have to current line hightlighted all the time
i've seen this in many TJ DeVries streams and wanted to know how he did it
i found this in a file in his config: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua
]]

-- Thanks, TJ!
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- don't continue comments onto new lines
vim.cmd ([[ autocmd FileType * set formatoptions-=cro ]])

-- set background
-- vim.o.background = "dark"

