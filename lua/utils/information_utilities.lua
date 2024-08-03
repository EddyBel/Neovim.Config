local M = {}

---This function must return the icon corresponding to the operating system, if it finds a distribution then it returns the icon of the distribution.
---@return string os Returns the operating system icon
M.get_system_icon = function()
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
M.all_lsp_clients = function()
    local client_names = {}
    local active_clients = vim.lsp.get_active_clients()
    local separator = " "
    local default_message = "LSP"

    if #active_clients == 0 then return ICONS.lsp .. " " .. default_message end
    for _, client in ipairs(active_clients) do
        table.insert(client_names, client.name)
    end
    return ICONS.lsp .. " " .. table.concat(client_names, separator)
end

---This function obtains the total number of active LSP clients.
---@return string count_lsp Returns a string with the total number of LSP clients
M.number_lsp_clients = function()
    local activate_clients = vim.lsp.get_active_clients()
    return ICONS.lsp .. " " .. #activate_clients
end

---This function gets the names of the active LSP clients for the current file.
---@return string lsp_names Returns a string with the names of the active servers for the file
M.lsp_clients_by_typefile = function()
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
M.lsp_status = function()
    local loading_chars = ICONS.spinner
    local message_text = "LSP"
    local lsp_status = vim.lsp.buf_get_clients()

    if next(lsp_status) == nil then
        local current_char_index = math.floor(vim.fn.localtime() * 2) %
                                       #loading_chars + 1
        local loading_text = loading_chars[current_char_index]
        return loading_text .. " " .. message_text
    else
        return ""
    end
end

---This function obtains the current time
---@return string current_date Returns a string with the current time
M.current_date = function() return ICONS.time .. " " .. os.date("%R") end

M.neoformat_formatter = function()
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

M.current_root = function()
    local max_lenght = 10
    local current_directory = vim.fn.getcwd()
    local root_folder_name = vim.fn.fnamemodify(current_directory, ":t")
    if string.len(root_folder_name) > max_lenght then
        root_folder_name = string.sub(root_folder_name, 1, max_lenght) .. "..."
    end
    return ICONS.cmp_path .. " " .. root_folder_name
end

M.get_filename = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon = require'nvim-web-devicons'.get_icon(filename, extension)
    return icon .. ' ' .. filename
end

M.get_codeium_status = function()
    if ENV.COPILOT_CODEIUM_IS_ACTIVATE then
        return ICONS.cmp_codeium .. ' ' .. ENV.COPILOT_CODEIUM
    else
        return ''
    end
end

M.get_supermaven_status = function()
    local api = require("supermaven-nvim.api")
    local is_running = api.is_running()
    if is_running then
        return ICONS.cmp_supermaven .. ' ' .. ENV.COPILOT_SUPERMAVEN
    else
        return ''
    end

end

_G.INFORMATION_UTILITIES = M
