return {
    'nvim-lualine/lualine.nvim',
    config = function()
        ---This function must return the icon corresponding to the operating system, if it finds a distribution then it returns the icon of the distribution.
        ---@return string os Returns the operating system icon
        local function icon_system()
            if ENV.OS == ENV.WINDOWS then
                return ICONS.os["Windows"]
            elseif ENV.OS == ENV.MACOS then
                return ICONS.os["Darwin"]
            elseif ENV.OS == ENV.LINUX then
                for key, value in pairs(ICONS.os) do
                    if string.find(ENV.LINUX_DISTRIBUTION, key) then
                        return value
                    end
                end
                return ICONS.os["Linux"]
            else
                return ICONS.os["Default"]
            end
        end

        ---This function gets the name of all the active LSP servers, and returns the name of all the servers
        ---@return string LSP_names Returns a string with the names of the lsp servers.
        local function all_lsp_clients()
            local client_names = {}
            local active_clients = vim.lsp.get_active_clients()
            local separator = " "
            local default_message = "LSP"

            if #active_clients == 0 then return ICONS.lsp .. " " .. default_message end
            for _, client in ipairs(active_clients) do table.insert(client_names, client.name) end
            return ICONS.lsp .. " " .. table.concat(client_names, separator)
        end

        ---This function obtains the total number of active LSP clients.
        ---@return string count_lsp Returns a string with the total number of LSP clients
        local function number_lsp_clients()
            local activate_clients = vim.lsp.get_active_clients()
            return ICONS.lsp .. " " .. #activate_clients
        end

        ---This function gets the names of the active LSP clients for the current file.
        ---@return string lsp_names Returns a string with the names of the active servers for the file
        local function lsp_clients_by_typefile()
            local client_names = {}
            local bufnr = vim.api.nvim_get_current_buf()
            local buf_ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
            local active_clients = vim.lsp.get_active_clients()
            local separator = " "

            if #active_clients == 0 then return "" end

            for _, client in ipairs(active_clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.tbl_contains(filetypes, buf_ft) then
                    table.insert(client_names, client.name)
                end
            end

            return ICONS.lsp .. " " .. table.concat(client_names, separator)
        end

        ---This function displays a load style when there are no active LSP clients yet.
        ---@return string loader Returns a string symbolizing the load of the LSP clients
        local function lsp_status()
            local loading_chars = ICONS.spinner
            local message_text = "LSP"
            local lsp_status = vim.lsp.buf_get_clients()

            if next(lsp_status) == nil then
                local current_char_index = math.floor(vim.fn.localtime() * 2) % #loading_chars + 1
                local loading_text = loading_chars[current_char_index]
                return loading_text .. " " .. message_text
            else
                return ""
            end
        end

        ---This function obtains the current time
        ---@return string current_date Returns a string with the current time
        local function current_date()
            return ICONS.time .. " " .. os.date("%R")
        end


        local function neoformat_formatter()
            local filetype = vim.bo.filetype
            local formatters = CODE_FORMATTERS
            local formatter_by_file = formatters[filetype]
            local formatter_by_file_string = table.concat(formatter_by_file, " ")

            return ICONS.formatter .. " " .. formatter_by_file_string
        end

        local function current_root()
            local max_lenght = 10
            local current_directory = vim.fn.getcwd()
            local root_folder_name = vim.fn.fnamemodify(current_directory, ":t")
            if string.len(root_folder_name) > max_lenght then
                root_folder_name = string.sub(root_folder_name, 1, max_lenght) .. "..."
            end
            return ICONS.cmp_path .. " " .. root_folder_name
        end

        local diagnostic = {
            'diagnostics',
            padding = { left = 1, right = 1 },
            symbols = {
                error = ICONS.error .. " ",
                warn = ICONS.warn .. " ",
                info = ICONS.info .. " ",
                hint = ICONS.hint .. " ",
            }
        }
        local branch = {
            'branch',
            icons_enabled = true,
            icon = '',
        }

        local diff = {
            'diff',
            icons_enabled = true,
            symbols = {
                added = ICONS.git.add .. " ",
                modified = ICONS.git.modified .. " ",
                removed = ICONS.git.removed .. " "
            }
        }
        local encoding = {
            'encoding',
            padding = { left = 1, right = 1 }
        }
        local filetypes = {
            "filetype",
            padding = { left = 1, right = 1 }
        }

        local location = {
            "location",
            padding =
            { left = 1, right = 1 }
        }

        local progress = {
            "progress",
            padding = { left = 1, right = 1 }
        }

        local filename = {
            'filename',
            padding = { left = 1, right = 1 }
        }

        ---This function defines the type of status bar to be used.
        ---@return table sections Returns an object with the structure that will have the lualine status bar.
        local function type_section()
            if STATUSBAR.type == "completed" then
                return {
                    lualine_a = { 'mode' },
                    lualine_b = { lsp_clients_by_typefile, lsp_status, diagnostic },
                    lualine_c = { current_root, branch, diff },
                    lualine_x = { number_lsp_clients, neoformat_formatter, encoding, filetypes },
                    lualine_y = { location, progress },
                    lualine_z = { icon_system }
                }
            elseif STATUSBAR.type == "completed v2" then
                return {
                    lualine_a = { 'mode' },
                    lualine_b = { filename },
                    lualine_c = { branch, diff },
                    lualine_x = { neoformat_formatter, number_lsp_clients, lsp_clients_by_typefile, lsp_status,
                        diagnostic },
                    lualine_y = { current_root, location },
                    lualine_z = { icon_system }
                }
            elseif STATUSBAR.type == "simple" then
                return {
                    lualine_a = { 'mode' },
                    lualine_b = { filename },
                    lualine_c = { branch, diff },
                    lualine_x = { lsp_clients_by_typefile, lsp_status, diagnostic },
                    lualine_y = { current_root, progress },
                    lualine_z = { icon_system }
                }
            elseif STATUSBAR.type == "compact" then
                return {
                    lualine_a = { 'mode' },
                    lualine_b = { lsp_clients_by_typefile, lsp_status },
                    lualine_c = { branch },
                    lualine_x = { diagnostic },
                    lualine_y = { progress },
                    lualine_z = { icon_system }
                }
            else
                return {
                    lualine_a = { 'mode' },
                    lualine_b = { filename },
                    lualine_c = { branch },
                    lualine_x = { diagnostic },
                    lualine_y = { location, progress },
                    lualine_z = { icon_system }
                }
            end
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = STATUSBAR.theme,

                component_separators = STATUSBAR.separator,
                section_separators = STATUSBAR.decorator,
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = type_section(),
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
        )
    end,
}
