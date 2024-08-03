return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local diagnostic = {
            'diagnostics',
            symbols = {
                error = ICONS.error .. " ",
                warn = ICONS.warn .. " ",
                info = ICONS.info .. " ",
                hint = ICONS.hint .. " "
            }
        }
        local branch = { 'branch', icons_enabled = true, icon = '' }

        local diff = {
            'diff',
            icons_enabled = true,
            symbols = {
                added = ICONS.git.add .. " ",
                modified = ICONS.git.modified .. " ",
                removed = ICONS.git.removed .. " "
            }
        }
        local encoding = { 'encoding' }
        local filetypes = {
            "filetype",
            icons_enabled = true,
            colored_icon = true
        }

        local location = { "location" }

        local progress = { "progress" }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = STATUSBAR.theme,

                component_separators = STATUSBAR.separator,
                section_separators = STATUSBAR.decorator,
                disabled_filetypes = { statusline = {}, winbar = {} },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { INFORMATION_UTILITIES.get_filename },
                lualine_c = { branch },
                lualine_x = {
                    INFORMATION_UTILITIES.lsp_clients_by_typefile,
                    INFORMATION_UTILITIES.neoformat_formatter, diagnostic
                },
                lualine_y = {
                    INFORMATION_UTILITIES.get_codeium_status,
                    INFORMATION_UTILITIES.get_supermaven_status,
                    INFORMATION_UTILITIES.number_lsp_clients, progress
                },
                lualine_z = { INFORMATION_UTILITIES.get_system_icon }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
