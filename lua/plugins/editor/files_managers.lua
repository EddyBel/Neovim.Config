return {
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        priority = 1000,
        opts = {
            -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
            -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
            default_file_explorer = true,

            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,

            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                [KEYMAPS.oil_show_help[2]] = "actions.show_help",
                [KEYMAPS.oil_select[2]] = "actions.select",
                [KEYMAPS.oil_select_vertical[2]] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                [KEYMAPS.oil_select_horizontal[2]] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                [KEYMAPS.oil_select_tab[2]] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                [KEYMAPS.oil_preview[2]] = "actions.preview",
                [KEYMAPS.oil_close[2]] = "actions.close",
                [KEYMAPS.oil_refresh[2]] = "actions.refresh",
                [KEYMAPS.oil_parent[2]] = "actions.parent",
                [KEYMAPS.oil_open_cwd[2]] = "actions.open_cwd",
                [KEYMAPS.oil_cd[2]] = "actions.cd",
                [KEYMAPS.oil_cd_tab[2]] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                [KEYMAPS.oil_change_sort[2]] = "actions.change_sort",
                [KEYMAPS.oil_open_external[2]] = "actions.open_external",
                [KEYMAPS.oil_toggle_hidden[2]] = "actions.toggle_hidden",
                [KEYMAPS.oil_toggle_trash[2]] = "actions.toggle_trash",
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = false,
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VeryLazy",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" }
                            }
                        }
                    })
                end
            }
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            vim.g.NeoTreeAutoRefresh = 1
            vim.g.NeoTreeQuitOnOpen = 1
            require("neo-tree").setup({
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                -- open_files_do_not_replace_types = {"terminal", "trouble", "qf"} -- when opening files, do not use windows containing these filetypes or buftypes
                sort_case_insensitive = false,
                neo_refres = true,   -- used when sorting files and directories in the tree
                sort_function = nil, -- use a custom function for sorting files and directories in the tree
                default_component_configs = {
                    container = { enable_character_fade = true },
                    indent = {
                        indent_size = 2,
                        padding = 1, -- extra padding on left hand side
                        -- indent guides
                        with_markers = true,
                        indent_marker = TREE_SYMBOLS.indent_marker,
                        last_indent_marker = TREE_SYMBOLS.last_indent_marker,
                        highlight = "NeoTreeIndentMarker",
                        -- expander config, needed for nesting files
                        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                        expander_collapsed = TREE_SYMBOLS.expander_collapsed,
                        expander_expanded = TREE_SYMBOLS.expander_expanded,
                        expander_highlight = "NeoTreeExpander"
                    },
                    icon = {
                        folder_closed = TREE_SYMBOLS.folder_closed,
                        folder_open = TREE_SYMBOLS.folder_open,
                        folder_empty = TREE_SYMBOLS.folder_empty,
                        default = "*",
                        highlight = "NeoTreeFileIcon"
                    },
                    modified = {
                        symbol = TREE_SYMBOLS.modified_symbol,
                        highlight = "NeoTreeModified"
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName"
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added = TREE_SYMBOLS.added,       -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified = TREE_SYMBOLS.modified, -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted = TREE_SYMBOLS.deleted,   -- this can only be used in the git_status source
                            renamed = TREE_SYMBOLS.renamed,   -- this can only be used in the git_status source
                            -- Status type
                            untracked = TREE_SYMBOLS.untracked,
                            ignored = TREE_SYMBOLS.ignored,
                            unstaged = TREE_SYMBOLS.unstaged,
                            staged = TREE_SYMBOLS.staged,
                            conflict = TREE_SYMBOLS.conflict
                        }
                    }
                },
                -- A list of functions, each representing a global custom command
                -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
                -- see `:h neo-tree-global-custom-commands`
                commands = {},
                window = {
                    position = TREE_DIRECTION,
                    width = TREE_WIDTH,
                    mapping_options = { noremap = true, nowait = true },
                    mappings = {
                        ["<space>"] = {
                            "toggle_node",
                            nowait = false -- disable `nowait` if you have existing combos starting with this char that you want to use
                        },
                        ["<2-LeftMouse>"] = "open",
                        ["<cr>"] = "open",
                        ["<esc>"] = "revert_preview",
                        ["P"] = { "toggle_preview", config = { use_float = true } },
                        ["l"] = "focus_preview",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        ["a"] = {
                            "add",
                            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                            config = {
                                show_path = "none" -- "none", "relative", "absolute"
                            }
                        },
                        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                        ["<"] = "prev_source",
                        [">"] = "next_source"
                    }
                },
                nesting_rules = {},
                filesystem = {
                    filtered_items = {
                        visible = true, -- when true, they will just be displayed differently than normal items
                        hide_dotfiles = true,
                        hide_gitignored = true,
                        hide_hidden = true, -- only works on Windows for hidden files/directories
                        hide_by_name = {
                            -- "node_modules"
                        },
                        hide_by_pattern = { -- uses glob style patterns
                            -- "*.meta",
                            -- "*/src/*/tsconfig.json",
                        },
                        always_show = { -- remains visible even if other settings would normally hide it
                            -- ".gitignored",
                        },
                        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                            -- ".DS_Store",
                            -- "thumbs.db"
                        },
                        never_show_by_pattern = { -- uses glob style patterns
                            -- ".null-ls_*",
                        }
                    },
                    follow_current_file = {
                        enable = false
                    },                                      -- This will find and focus the file in the active buffer every
                    -- time the current file is changed while the tree is open.
                    group_empty_dirs = false,               -- when true, empty folders will be grouped together
                    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                    -- in whatever position is specified in window.position
                    -- "open_current",  -- netrw disabled, opening a directory opens within the
                    -- window like netrw would, regardless of window.position
                    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
                    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                    -- instead of relying on nvim autocmd events.
                    window = {
                        mappings = {
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root",
                            ["H"] = "toggle_hidden",
                            ["/"] = "fuzzy_finder",
                            ["D"] = "fuzzy_finder_directory",
                            ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                            -- ["D"] = "fuzzy_sorter_directory",
                            ["f"] = "filter_on_submit",
                            ["<c-x>"] = "clear_filter",
                            ["[g"] = "prev_git_modified",
                            ["]g"] = "next_git_modified"
                        },
                        fuzzy_finder_mappings = {
                            -- define keymaps for filter popup window in fuzzy_finder_mode
                            ["<down>"] = "move_cursor_down",
                            ["<C-n>"] = "move_cursor_down",
                            ["<up>"] = "move_cursor_up",
                            ["<C-p>"] = "move_cursor_up"
                        }
                    },
                    commands = {} -- Add a custom command or override a global one using the same function name
                },
                buffers = {
                    follow_current_file = {
                        enable = true
                    },
                    -- time the current file is changed while the tree is open.
                    group_empty_dirs = true, -- when true, empty folders will be grouped together
                    show_unloaded = true,
                    window = {
                        mappings = {
                            ["bd"] = "buffer_delete",
                            ["<bs>"] = "navigate_up",
                            ["."] = "set_root"
                        }
                    }
                },
                git_status = {
                    window = {
                        position = "float",
                        mappings = {
                            ["A"] = "git_add_all",
                            ["gu"] = "git_unstage_file",
                            ["ga"] = "git_add_file",
                            ["gr"] = "git_revert_file",
                            ["gc"] = "git_commit",
                            ["gp"] = "git_push",
                            ["gg"] = "git_commit_and_push"
                        }
                    }
                }
            })
            --         vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
        end
    }
}
