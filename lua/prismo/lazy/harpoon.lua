    -- harpoon2
    return {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup({})

            -- accessing the harpoon:list()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)

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
    }

