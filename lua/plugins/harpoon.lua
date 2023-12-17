--------------------------
-- HARPOON
--------------------------

return {
    'ThePrimeagen/harpoon',
    config = function()
    local harpoon = require('harpoon')
    harpoon:setup({
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end),
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end),

        vim.keymap.set("n", "<C-o>", function() harpoon:list():select(1) end),
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end),
        vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end),
        vim.keymap.set("n", "<C-f>", function() harpoon:list():select(4) end),
    })	
    end
}
