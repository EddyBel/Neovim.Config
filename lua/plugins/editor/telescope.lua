return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", }
    },
    config = function()
        local telescope = require("telescope")

        --- Confugurations basics for telescope
        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                mappings = {
                    i = {
                        -- Cambia el atajo de teclado para "Next item" y "Previous item"
                        ["<Tab>"] = require('telescope.actions').move_selection_next,
                        ["<S-Tab>"] = require('telescope.actions').move_selection_previous,

                        -- Reasigna las funciones de selección
                        ["<C-n>"] = require('telescope.actions').toggle_selection,
                        ["<C-p>"] = require('telescope.actions').toggle_selection,

                        -- Open windows
                        -- ["<C-w>v"] = require('telescope.actions').select_vertical,
                        -- ["<C-w>h"] = require('telescope.actions').select_horizontal,
                        -- ["<C>wv"] = require('telescope.actions').file_vsplit,
                        -- ["<C>wh"] = require('telescope.actions').file_split,
                    },
                    n = {

                        -- Reasigna las funciones de selección en el modo normal
                        ["<C-n>"] = require('telescope.actions').toggle_selection,
                        ["<C-p>"] = require('telescope.actions').toggle_selection,

                        -- Open windows
                        -- ["<C-w>v"] = require('telescope.actions').select_vertical,
                        -- ["<C-w>h"] = require('telescope.actions').select_horizontal,
                        -- ["<C>wv"] = require('telescope.actions').file_vsplit,
                        -- ["<C>wh"] = require('telescope.actions').file_split,


                    },
                },
            },
            -- pickers = {
            --     find_files = {
            --         theme = "dropdown",
            --     }
            -- },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = false, -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg" },
                    find_cmd = "rg", -- find command (defaults to `fd`)
                },
            }
        })

        telescope.load_extension("live_grep_args")
    end,
}
