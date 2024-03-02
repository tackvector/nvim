    -- neo-tree
    return {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            local neotree = require("neo-tree")
            neotree.setup({
                event_handlers = {
                    {
                        -- close Neotree after I've selected a file (the way Dired works in Emacs)
                        event = "file_opened",
                        handler = function(file_path)
                            vim.cmd("Neotree close")
                        end
                    },
                },
                -- another nod to Dired
                window = {
                    position = "bottom",
                },
                mappings = {
                    ["q"] = "close_window",
                },
                git_status = {
                    window = {
                        position = "bottom",
                    },
                    mappings = {
                        ["A"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    }
                }
            })
            vim.keymap.set("n", "<M-x>f", ":Neotree toggle<cr>")
            vim.keymap.set("n", "<M-x>g", ":Neotree git_status toggle<cr>")
        end
    }
