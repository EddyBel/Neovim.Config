return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        'dcampos/cmp-snippy',
        "dcampos/nvim-snippy",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        "windwp/nvim-autopairs",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "honza/vim-snippets",
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        "L3MON4D3/LuaSnip",
    },
    event = "VeryLazy",
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        local lspkind = require "lspkind"
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        local compare = require "cmp.config.compare"

        -- Configures the automatic insertion of character pairs
        -- Indicates how to concatenate code hints
        require("nvim-autopairs").setup()
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })


        ---Scroll up in a drop-down menu, or select the next option in an autocomplete.
        ---If a drop-down menu is visible, select the previous option.
        ---If an autocomplete is active, select the next option.
        ---If neither drop-down menu nor autocomplete is active, call the fallback function.
        ---@param fallback function The function that is called if neither drop-down menu nor auto-completion is active.
        local function go_up_in_menu(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end

        ---Scroll down a drop-down menu, or select the previous option in an autocomplete.
        ---If a drop-down menu is visible, select the next option.
        ---If an autocomplete is active, select the previous option.
        ---If neither drop-down menu nor autocomplete is active, call the fallback function.
        ---@param fallback function function is called if neither drop-down menu nor auto-completion is active.
        local function go_down_in_menu(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end

        ---Closes a drop-down menu, or expands or jumps to a code fragment in an autocomplete.
        ---If a drop-down menu is visible, closes it.
        ---If an autocomplete is active and the current snippet has empty fields, completes them.
        ---If an autocomplete is active and the current fragment has no empty fields, it jumps to the next field.
        ---If neither drop-down menu nor autocomplete is active, calls the fallback function.
        ---@param fallback function function is called if neither drop-down menu nor auto-completion is active.
        local function go_close_menu(fallback)
            if cmp.visible() then
                cmp.close()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end


        ---Design options for the neovim cmp window
        local ui_window = cmp.config.window.bordered()
        ui_window.winhighlight = "Normal:CmpPmenu,CursorLine:Visual,Search:PmenuSel"

        cmp.setup {

            -- completion = {
            --     completeopt = "menu,menuone",
            -- },

            -- Defines that the selection is made by default on the first element
            initial_select = cmp.SelectFirst,

            -- Design of cmp floating windows
            window = {
                completion = ui_window,
                documentation = ui_window
            },

            -- Configures the keys to be used to operate the menu
            -- Ctrl + d Shift up 4 elements of the help documents
            -- Ctrl + f Scrolls down 4 elements of the help documents
            -- Down Scrolls down the options
            -- Up Scrolls the options upwards
            -- Enter to confirm autocomplete selection -- Ctrl + space to complete the autocomplete selection
            -- Ctrl + space to complete the autocompletion
            mapping = {
                ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                ["<C-k>"] = cmp.mapping.scroll_docs(4),
                ["<Down>"] = cmp.mapping(go_down_in_menu, { "i", "s" }),
                ["<Up>"] = cmp.mapping(go_up_in_menu, { "i", "s" }),
                ["<C-c>"] = cmp.mapping(go_close_menu, { "i", "s" }),
                ["<Enter>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true, },
                ["<Tab>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-n>"] = cmp.mapping.complete()
            },

            -- Define the sources to use to display autocomplete information.
            -- nvim_lua -> Uses the Neovim Lua API for autocompletion. This allows to autocomplete functions, variables and other items in Lua files that are open in Neovim.
            -- nvim_lsp -> Uses the LSP (Language Server Protocol) to autocomplete items in any language that has an LSP server available. This server provides information such as documentation and types of the elements that are autocompleted.
            -- path -> Uses the names of files and directories in the file system as sources for auto-completion in Neovim commands that require a file path.
            -- luasnip -> Uses the "luasnip" snippet library to provide auto-completion of code snippets. These are predefined code snippets that can be inserted into a file by just typing an abbreviation.
            -- nvim_lsp_signature_help -> Uses the LSP protocol to display help information in the signature of a function or method while writing to a file.
            -- buffer -> Uses the contents of the current buffer for auto-completion. This source is useful when working with files that do not have auto-completion support in Neovim, such as configuration files or plain text files.
            sources = {
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = 'vsnip' },
                { name = 'snippy' },
                { name = "nvim_lsp_signature_help" },
                {
                    name = "buffer",
                    keyword_length = 4,
                    option = {
                        get_bufnrs = function()
                            local bufs = {}
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                local bufnr = vim.api.nvim_win_get_buf(win)
                                if vim.api.nvim_buf_get_option(bufnr, 'buftype') ~= 'terminal' then bufs[bufnr] = true end
                            end
                            return vim.tbl_keys(bufs)
                        end,
                    },
                }
            },

            ---```formatting`` is a table that allows you to customize the appearance of autocomplete items in `cmp`.
            ---``format` is a function that takes an autocomplete entry `cmp.Entry` and an object `cmp.VimItem` and returns
            ---`a string representing how the item should be displayed.
            ---`with_text` is a boolean indicating whether to display the full text of the autocomplete entry.
            ---``menu` is a table that maps autocomplete source names to custom tags to be
            ---will be displayed in the autocomplete menu. Common source names are "nvim_lsp", "buffer", "nvim_lua",
            --- "path", "luasnip" and "vim-dadbod-completion".
            formatting = {
                fields = { 'menu', 'abbr', 'kind' },
                format = lspkind.cmp_format {
                    with_text = true,
                    menu = {
                        nvim_lsp = ICONS.lsp .. " ",
                        buffer = ICONS.cmp_buffer .. " ",
                        nvim_lua = ICONS.cmp_lua .. " ",
                        path = ICONS.cmp_path .. " ",
                        snippy = ICONS.cmp_snippets .. " ",
                        vsnip = ICONS.cmp_vsnip .. " ",
                        luasnip = ICONS.cmp_luasnip .. " ",
                        ["vim-dadbod-completion"] = ICONS.cmp_db .. " ",
                    },
                },
            },

            -- formatting = {
            --     fields = { 'menu', 'abbr', 'kind' },
            --     format = function(entry, vim_item)
            --         vim_item.kind = ({
            --             Text = '',
            --             Method = '',
            --             Function = '󰆧',
            --             Constructor = '',
            --             Field = 'ﰠ',
            --             Variable = '',
            --             Class = '',
            --             Interface = '',
            --             Module = '',
            --             Property = 'ﰠ',
            --             Unit = '塞',
            --             Value = '',
            --             Enum = '',
            --             Keyword = '',
            --             Snippet = '',
            --             Color = '',
            --             File = '',
            --             Reference = '',
            --             Folder = '',
            --             EnumMember = '',
            --             Constant = '',
            --             Struct = 'פּ',
            --             Event = '',
            --             Operator = '',
            --             TypeParameter = '',
            --         })[vim_item.kind]
            --         vim_item.menu = ({
            --             nvim_lsp = ICONS.lsp .. " ",
            --             buffer = ICONS.cmp_buffer .. " ",
            --             nvim_lua = ICONS.cmp_lua .. " ",
            --             path = ICONS.cmp_path .. " ",
            --             snippy = ICONS.cmp_snippets .. " ",
            --             vsnip = ICONS.cmp_vsnip .. " ",
            --             luasnip = ICONS.cmp_luasnip .. " ",
            --             ["vim-dadbod-completion"] = ICONS.cmp_db .. " ",
            --         })[entry.source.name]
            --
            --         return vim_item
            --     end
            -- }
            -- ,


            -- La sección snippet define una función anónima expand que se utilizará para expandir los snippets. Dentro de la función, se llama a la función lsp_expand de la biblioteca luasnip
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            ---`sorting` is a table that allows you to customize how autocomplete entries are sorted in `cmp`.
            ---`priority_weight` is a number used to determine the relative importance of the priority of an autocomplete entry.
            ---autocomplete entry. Autocomplete entries with higher priorities will be placed before lower priority entries.
            ---entries with lower priorities.
            ---`comparators` is a table of functions that are used to compare autocomplete entries.
            ---functions must take two arguments `lhs` and `rhs`, which are the two entries to be compared, and
            ---they must return a boolean value indicating whether `lhs` is greater than `rhs`. The functions are applied in the
            ---order in which they appear in the table. In the example provided, the entries are sorted first by type
            ---(`kind`) and then by their sort text (`sort_text`).
            -- sorting = {
            --     priority_weight = 2,
            --     comparators = {
            --         compare.kind,
            --         -- compare.score,
            --         compare.sort_text,
            --     },
            -- },

            ---`experimental` section is a table that allows to enable experimental functions in `cmp`.
            ---`native_menu` is a boolean option that allows you to enable the native menu functionality of the `cmp`.
            ---platform's native menu functionality. This can provide a more consistent user experience, but it may have
            ---compatibility issues with some environments. The default is `false`.
            ---`ghost_text` is a boolean option that allows ghost text to be enabled for entries from
            ---autocomplete. The default value is `false`.
            experimental = {
                native_menu = false,
                ghost_text = CMP_GHOST_TEXT,
            },
        }

        --- `gitcommit` autocomplete settings
        ---@param ft string The file type for which the autocompletion is to be configured.
        ---@param opts table A table containing configuration options for `cmp`.
        ---@field sources table A table of sources to be used for autocompletion.
        --- Each source is a table that must include at least one `name` field with the name of the source.
        --- The sources are provided in order of priority, and the highest priority sources will be displayed first in the autocompletion menu.
        --- the auto-completion menu.
        --- The provided code configures `cmp` for the `gitcommit` file type with specific configuration options.
        --- specific. The `sources` table is used to configure the autocomplete sources to be used --- for this file type.
        --- for this file type. In this case, the `cmp_git` source is placed first, followed by the `buffer` source.
        --- `buffer`.
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" },
            }, {
                { name = "buffer" },
            }),
        })


        --- Command line autocomplete setting for buffered search
        ---@param trigger string The character to be used to trigger command line auto-completion.
        ---@param opts table A table containing configuration options for `cmp`.
        ---@field mapping table A table containing custom key mappings for the autocompletion.
        --- If not provided, the default key mapping for the command line will be used.
        ---@field sources table A table of sources to be used for auto-completion.
        --- Each source is a table that must include at least one `name` field with the name of the source.
        --- The sources are provided in order of priority, and the highest priority sources will be displayed first in the autocompletion menu.
        --- the auto-completion menu.
        --- The provided code configures `cmp` for the buffered search command line with specific configuration options.
        --- specific configuration options. The `/` character is used to activate the command line auto-completion and the default key mapping is used to --- activate the command line auto-completion.
        --- default key mapping is used for auto-completion. The `sources` table is used to
        --- configure the auto-completion sources to be used. In this case, the `buffer` font is used
        --- exclusively for the buffered search.
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })


        ---Set the command line `cmp` extension.
        ---@param prefix string The prefix to be used to invoke the command line.
        ---@param config table A table containing the `cmp` configuration for the command line.
        ---@field mapping function A table containing the key mappings for the command line.
        ---@field sources function A table containing the data sources for the command line.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })


        ---Configures `cmp` for SQL, MySQL and PL/SQL file types.
        ---@param filetypes table table containing the file types for which `cmp` will be configured.
        ---@param config table table containing the `cmp` configuration for the filetypes.
        ---@field sources function table containing the data sources for the file types.
        cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
            sources = cmp.config.sources({
                { name = "vim-dadbod-completion" },
            }, {
                { name = "buffer" },
            }),
        })
    end,
}
