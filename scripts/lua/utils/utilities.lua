local utils = {}

---This function takes a file name and according to the extension defined for each operating system it will be concatenated to the file name.
---@param name_extension string Name of the file to be modified
---@param windows_extension string Extension to be added in case of windows systems
---@param linux_extension string Extension to be added in case of linux systems
---@param macos_extension string Extension to be added in case of macos systems
---@return string executable will return the name of the modified executable according to your operating system.
utils.get_executable_extension = function(name_extension, windows_extension, linux_extension, macos_extension)
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
utils.current_path = function()
    return vim.fn.getcwd()
end

_G.UTILS = utils
