--------------------------
-- NEOVIDE
--------------------------

if vim.g.neovide then
	vim.o.guifont = "Iosevka Nerd Font:h14"
	vim.opt.linespace = 1
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_fullscreen = true
	vim.g.neovide_cursor_animation_length = 0.01
	vim.g.neovide_cursor_trail_size = 0.5
end
