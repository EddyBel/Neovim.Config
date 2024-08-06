local globals = require("globals")
local STATUSBAR = globals.STATUSBAR

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local information = STATUSBAR.information
        local lualine_a = {}
        local lualine_b = {}
        local lualine_c = {}
        local lualine_x = {}
        local lualine_y = {}
        local lualine_z = {}

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

        --- Add information to the lualine_x

        if information.lsp_clients_names then
            table.insert(lualine_x, INFORMATION_UTILITIES.lsp_clients_by_typefile)
        end

        if information.lsp_formatter then
            table.insert(lualine_x, INFORMATION_UTILITIES.neoformat_formatter)
        end

        table.insert(lualine_x, diagnostic)

        --- Add information to the lualine_y

        if information.assistant then
            table.insert(lualine_y, INFORMATION_UTILITIES.get_codeium_status)
            table.insert(lualine_y, INFORMATION_UTILITIES.get_supermaven_status)
        end

        if information.lsp_clients_number then
            table.insert(lualine_y, INFORMATION_UTILITIES.number_lsp_clients)
        end

        table.insert(lualine_y, progress)


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
                lualine_x = lualine_x,
                lualine_y = lualine_y,
                lualine_z = { INFORMATION_UTILITIES.get_system_icon }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
