local M = {}

---This function takes a file name and according to the extension defined for each operating system it will be concatenated to the file name.
---@param name_extension string Name of the file to be modified
---@param windows_extension string Extension to be added in case of windows systems
---@param linux_extension string Extension to be added in case of linux systems
---@param macos_extension string Extension to be added in case of macos systems
---@return string executable will return the name of the modified executable according to your operating system.
M.get_executable_extension = function(name_extension, windows_extension, linux_extension, macos_extension)
    windows_extension = windows_extension or ""
    linux_extension = linux_extension or ""
    macos_extension = macos_extension or ""

    if ENV.OS == ENV.WINDOWS then
        return name_extension .. windows_extension
    elseif ENV.OS == ENV.LINUX then
        return name_extension .. linux_extension
    elseif ENV.OS == ENV.MACOS then
        return name_extension .. macos_extension
    else
        return name_extension
    end
end

---This function should return the path from which neovim was opened.
M.current_path = function()
    return vim.fn.getcwd()
end

---This function updates the number of open buffers in the current session.
M.update_number_open_buffers = function()
    local buffers = vim.api.nvim_list_bufs()
    local open_buffers = 0
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
            open_buffers = open_buffers + 1
        end
    end
    ENV.NUMBER_OPEN_BUFFERS = open_buffers
end

--- FUNCTIONS TO CHECK IF COMMANDS EXIST

---this function checks if a command exists
---@param cmd string command to check
---@return boolean true if the command exists, false otherwise
M.command_exists = function(cmd)
    return vim.fn.executable(cmd) == 1
end

---this function checks if a command exists in the list
---@param commands any list of commands
---@return table with the result of the check
M.check_commands = function(commands)
    local result = { check = false, command = nil }

    for _, cmd in ipairs(commands) do
        if M.command_exists(cmd) then
            result.check = true
            result.command = cmd
            break -- Salir del bucle al encontrar el primer comando existente
        end
    end

    return result
end

---this function checks if all the commands in the list exist
---@param commands any list of commands
---@return boolean true if all the commands exist, false otherwise
M.all_commands_exist = function(commands)
    for _, cmd in ipairs(commands) do
        if not M.command_exists(cmd) then
            return false
        end
    end
    return true
end

_G.UTILS = M

return M
