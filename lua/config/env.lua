local M = {}

---Indicates the name of the windows system
M.WINDOWS = "Windows"
---Indicates the name of the linux system
M.LINUX = "Linux"
---Indicates the name of the macos system
M.MACOS = "Darwin"

---This variable stores the name of the operating system where neovim is running.
---Return OS string Returns the name of the operating system Windows, Linux or MacOS, if not identified returns Unknown
M.OS = (vim.fn.has("win32") == 1) and M.WINDOWS or (vim.fn.has("unix") == 1) and
    M.LINUX or (vim.fn.has("mac") == 1) and M.MACOS or "Unknown"

-- This code snippet gets the name of the Linux distribution in case you are using Linux
if M.OS == M.LINUX then
    -- Try reading /etc/os-release
    local file = io.open("/etc/os-release", "r")
    if file then
        for line in file:lines() do
            local name = line:match("NAME=\"(.-)\"")
            if name then
                M.LINUX_DISTRIBUTION = name
                break
            end
        end
        file:close()
    end

    -- If /etc/os-release didn't work, try /etc/lsb-release
    file = io.open("/etc/lsb-release", "r")
    if file then
        for line in file:lines() do
            local name = line:match("DISTRIB_ID=(.-)$")
            if name then
                M.LINUX_DISTRIBUTION = name
                break
            end
        end
        file:close()
    end

    -- If both files failed, return "Linux" as default
    ---Variable that stores the Linux distribution used
    if not M.LINUX_DISTRIBUTION then M.LINUX_DISTRIBUTION = "Linux" end
end

M.COPILOT_CODEIUM = "Codeium"
M.COPILOT_SUPERMAVEN = "Supermaven"
M.COPILOT_GITHUB_COPILOT = "Copilot"
M.COPILOT_CODEIUM_IS_ACTIVATE = false


--- VARIABLES DINAMICS

---This variable stores the number of buffers opened in the current session
M.NUMBER_OPEN_BUFFERS = 0

_G.ENV = M
