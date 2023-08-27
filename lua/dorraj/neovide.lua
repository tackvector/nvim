--------------------------
-- NEOVIDE
--------------------------

if vim.g.neovide then
    vim.o.guifont = 'Iosevka Nerd Font:h16'
    vim.opt.linespace = 3
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_theme = 'dark'
end
