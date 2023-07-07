local data_utilities = {}

---This function must return the icon corresponding to the operating system, if it finds a distribution then it returns the icon of the distribution.
---@return string os Returns the operating system icon
data_utilities.get_system_icon = function()
    if ENV.OS == ENV.WINDOWS then
        return ICONS.os["Windows"]
    elseif ENV.OS == ENV.MACOS then
        return ICONS.os["Darwin"]
    elseif ENV.OS == ENV.LINUX then
        local distribution = string.lower(ENV.LINUX_DISTRIBUTION)
        for key, value in pairs(ICONS.os) do
            if string.find(distribution, string.lower(key)) then
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
data_utilities.all_lsp_clients = function()
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
data_utilities.number_lsp_clients = function()
    local activate_clients = vim.lsp.get_active_clients()
    return ICONS.lsp .. " " .. #activate_clients
end

---This function gets the names of the active LSP clients for the current file.
---@return string lsp_names Returns a string with the names of the active servers for the file
data_utilities.lsp_clients_by_typefile = function()
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
data_utilities.lsp_status = function()
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
data_utilities.current_date = function()
    return ICONS.time .. " " .. os.date("%R")
end


data_utilities.neoformat_formatter = function()
    local filetype = vim.bo.filetype
    local formatters = CODE_FORMATTERS
    local formatter_by_file = formatters[filetype]
    local message_default = "formatter"
    if formatter_by_file ~= nil then
        local formatter_by_file_string = table.concat(formatter_by_file, " ")
        return ICONS.formatter .. " " .. formatter_by_file_string
    else
        return ICONS.formatter .. " " .. message_default
    end
end

data_utilities.current_root = function()
    local max_lenght = 10
    local current_directory = vim.fn.getcwd()
    local root_folder_name = vim.fn.fnamemodify(current_directory, ":t")
    if string.len(root_folder_name) > max_lenght then
        root_folder_name = string.sub(root_folder_name, 1, max_lenght) .. "..."
    end
    return ICONS.cmp_path .. " " .. root_folder_name
end

data_utilities.get_filename = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon = require 'nvim-web-devicons'.get_icon(filename, extension)
    return icon .. ' ' .. filename
end


_G.INFORMATION_UTILITIES = data_utilities
