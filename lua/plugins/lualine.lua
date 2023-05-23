return {
    'nvim-lualine/lualine.nvim',
    config = function()
        ---
        -- Gets the name of the current operating system.
        --
        -- This function performs the following steps:
        -- 1. Maps the operating system names to corresponding icons.
        -- 2. Obtains the operating system name using the `vim.loop.os_uname()` function.
        -- 3. Compares the operating system name with specific patterns to determine the current operating system.
        -- 4. If the operating system is Windows, returns the icon corresponding to Windows.
        -- 5. If the operating system is macOS (Darwin), returns the icon corresponding to macOS.
        -- 6. If the operating system is Linux, it checks for specific distributions by reading the contents of the "/etc/os-release" file.
        -- 7. If it finds a match with a specific distribution, it returns the icon corresponding to that distribution.
        -- 8. If no specific distribution is found, it returns the icon corresponding to Linux by default.
        -- 9. If the operating system does not match any pattern, returns the icon corresponding to the operating system name or the default icon.
        --
        -- Has no explicit parameters.
        --
        -- @return The icon corresponding to the current operating system.
        --
        -- Usage example:
        -- local osIcon = get_operating_system().
        -- Gets the icon corresponding to the current operating system.
        ---
        function get_operating_system()
            local os_map = ICONS.os
            local sys_name = vim.loop.os_uname().sysname

            if sys_name:match("Windows") then
                return os_map["Windows"]
            elseif sys_name:match("Darwin") then
                return os_map["Darwin"]
            elseif sys_name == "Linux" then
                -- Verificar distribuciones específicas de Linux
                local release_file = io.open("/etc/os-release", "r")
                if release_file then
                    local release_content = release_file:read("*all")
                    release_file:close()

                    for key, value in pairs(os_map) do
                        if release_content:match(key) then
                            return os_map[value] or os_map["Defaul"]
                        end
                    end
                end

                -- Si no se encuentra ninguna distribución específica, retornar "Linux" por defecto
                return os_map["Linux"]
            else
                return os_map[sys_name] or os_map["Default"]
            end
        end

        ---
        -- Obtains a representation of active LSP clients.
        --
        -- This function performs the following steps:
        -- 1. Creates an empty table `client_names` to store the LSP client names.
        -- 2. Gets the active LSP clients using `vim.lsp.get_active_clients()`.
        -- 3. Defines a client name separator, by default a whitespace.
        -- 4. Define a default message when no LSP clients are active.
        -- 5. If there are no active LSP clients, returns the default icon and message.
        -- 6. Iterates over the active LSP clients and adds their names to the `client_names` table.
        -- 7. Returns a representation of the active LSP clients, consisting of the LSP icon followed by the client names separated by the separator.
        --
        -- @return A representation of the active LSP clients.
        --
        -- Usage example:
        -- local clients = get_all_lsp_clients().
        -- Gets a representation of the active LSP clients.
        ---
        local function get_all_lsp_clients()
            local client_names = {}
            local active_clients = vim.lsp.get_active_clients()
            local separator = " "
            local default_message = "LSP"

            if #active_clients == 0 then return icon .. " " .. default_message end
            for _, client in ipairs(active_clients) do table.insert(client_names, client.name) end
            return ICONS.lsp .. " " .. table.concat(client_names, separator)
        end

        ---
        -- Gets the number of active LSP clients.
        --
        -- This function performs the following steps:
        -- 1. Gets the active LSP clients using `vim.lsp.get_active_clients()`.
        -- Returns a representation of the LSP icon followed by the number of active LSP clients.
        --
        -- @return The number of active LSP clients.
        --
        -- Usage example:
        -- local count = number_lsp_clients().
        -- Gets the number of active LSP clients.
        ---
        local function number_lsp_clients()
            local activate_clients = vim.lsp.get_active_clients()
            return ICONS.lsp .. " " .. #activate_clients
        end

        ---
        -- Gets a representation of active LSP clients that support the current file type.
        --
        -- This function performs the following steps:
        -- 1. Creates an empty table `client_names` to store the names of the LSP clients that support the current file type.
        -- 2. Gets the current buffer number using `vim.api.nvim_get_current_buf()`.
        -- 3. Get the file type of the current buffer using `vim.api.nvim_buf_get_get_option(bufnr, 'filetype')`.
        -- 4. Gets the active LSP clients using `vim.lsp.get_active_clients()`.
        -- 5. Defines a client name separator, by default a whitespace.
        -- 6. Define a default message when there are no active LSP clients.
        -- 7. If there are no active LSP clients, returns an empty string.
        -- 8. Iterates over the active LSP clients and checks if they support the current file type.
        -- 9. If a client supports the current file type, adds its name to the `client_names` table.
        -- 10. If no clients were found that support the current file type, returns the default icon and message.
        -- 11. Returns a representation of the active LSP clients supporting the current file type, consisting of the LSP icon followed by the client names separated by the separator.
        --
        -- @return A representation of the active LSP clients supporting the current file type.
        --
        -- Usage example:
        -- local clients = get_active_lsp_clients_by_typefile().
        -- Gets a representation of the active LSP clients that support the current file type.
        ---
        local function get_active_lsp_clients_by_typefile()
            local client_names = {}
            local bufnr = vim.api.nvim_get_current_buf()
            local buf_ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
            local active_clients = vim.lsp.get_active_clients()
            local separator = " "
            local default_message = "LSP"

            if #active_clients == 0 then return "" end

            for _, client in ipairs(active_clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.tbl_contains(filetypes, buf_ft) then
                    table.insert(client_names, client.name)
                end
            end

            if #client_names == 0 then return icon .. " " .. default_message end

            return ICONS.lsp .. " " .. table.concat(client_names, separator)
        end

        ---
        -- Gets the current status of the LSP server.
        --
        -- This function performs the following steps:
        -- 1. Defines the `loading_chars` that are used for the loading animation.
        -- Defines the default text message when there are no LSP servers available.
        -- Gets the status of the LSP clients using `vim.lsp.buf_get_clients()`.
        -- If no LSP servers are available, a current load character is selected based on the local time for the load animation.
        -- Returns the combination of the current load character, followed by the text message.
        -- If LSP servers are available, an empty string is returned.
        --
        -- @return The current status of the LSP server.
        --
        -- Usage example:
        -- local status = lsp_status().
        -- Gets the current status of the LSP server.
        ---
        local function lsp_status()
            local loading_chars = ICONS.spinner
            local message_text = "Waiting for LSP"
            local lsp_status = vim.lsp.buf_get_clients()

            if next(lsp_status) == nil then
                local current_char_index = math.floor(vim.fn.localtime() * 2) % #loading_chars + 1
                local loading_text = loading_chars[current_char_index]
                return loading_text .. " " .. message_text
            else
                return ""
            end
        end

        ---
        -- Gets the current date in time format.
        --
        -- This function uses `os.date` to get the current date in time format.
        -- The time format used is `%R`, which represents the time in 24-hour format (e.g. `14:30`).
        -- Then, it combines the icon corresponding to the time with the result obtained from `os.date`.
        --
        -- @return The current date in time format.
        --
        -- Usage example:
        -- local date = get_date()
        -- Gets the current date in time format.
        ---
        local function get_date()
            return ICONS.time .. " " .. os.date("%R")
        end


        ---
        -- Gets the enabled formatter for the current file type according to the Neoformat settings.
        --
        -- This function gets the current file type and searches the Neoformat configuration for the enabled formatter for that file type.
        -- The Neoformat configuration contains a number of global variables with names like `neoformat_enabled_xxx`, where `xxx` represents the file type name.
        -- Uses the current file type to access the corresponding global variable and get the enabled formatter for that file type.
        -- Then, it combines the icon corresponding to the formatter with the values obtained from the Neoformat configuration using `table.concat`.
        --
        -- @return The enabled formatter for the current file type according to the Neoformat configuration.
        --
        -- Usage example:
        -- local formatter = get_neoformat_formatter().
        -- Gets the enabled formatter for the current file type as configured by Neoformat.
        ---
        function get_neoformat_formatter()
            local filetype = vim.bo.filetype
            local formatters = CODE_FORMATTERS
            local formatter_by_file = formatters[filetype]
            local formatter_by_file_string = table.concat(formatter_by_file, " ")

            return ICONS.formatter .. " " .. formatter_by_file_string
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = COLOR_THEME_STATUSBAR,

                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
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
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', {
                    'diagnostics',
                    padding = { left = 1, right = 1 },
                    symbols = {
                        error = ICONS.error .. " ",
                        warn = ICONS.warn .. " ",
                        info = ICONS.info .. " ",
                        hint = ICONS.hint .. " ",
                    }
                }, get_active_lsp_clients_by_typefile, lsp_status },
                lualine_c = { 'filename' },
                lualine_x = { get_neoformat_formatter, number_lsp_clients,
                    { 'encoding', padding = { left = 1, right = 1 } } },
                lualine_y = { { "filetype", padding = { left = 1, right = 0 } },
                    { "progress", separator = " ",                  padding = { left = 1, right = 1 } }, },
                lualine_z = {
                    { "location", padding = { left = 0, right = 0 } },
                    get_operating_system }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
        )
    end,
}
