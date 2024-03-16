-- Telescope 
-- TODO: find out how to ignore lazy-lock.json without adding it to .gitignore
return {
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
                layout_strategy = 'vertical',
                layout_config = {
                    prompt_position = "top",
                    -- broke something. found a fix here: https://github.com/nvim-telescope/telescope.nvim/issues/1594#issuecomment-993447528
                    preview_cutoff = 0,
                    width = 0.50,
                    height = 0.80,
                }
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
}
