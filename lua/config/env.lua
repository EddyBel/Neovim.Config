local env = {}

---Indicates the name of the windows system
env.WINDOWS = "Windows"
---Indicates the name of the linux system
env.LINUX = "Linux"
---Indicates the name of the macos system
env.MACOS = "Darwin"

---This variable stores the name of the operating system where neovim is running.
---Return OS string Returns the name of the operating system Windows, Linux or MacOS, if not identified returns Unknown
env.OS = (vim.fn.has("win32") == 1) and env.WINDOWS
    or (vim.fn.has("unix") == 1) and env.LINUX
    or (vim.fn.has("mac") == 1) and env.MACOS
    or "Unknown"

-- This code snippet gets the name of the Linux distribution in case you are using Linux
if env.OS == env.LINUX then
    -- Try reading /etc/os-release
    local file = io.open("/etc/os-release", "r")
    if file then
        for line in file:lines() do
            local name = line:match("NAME=\"(.-)\"")
            if name then
                env.LINUX_DISTRIBUTION = name
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
                env.LINUX_DISTRIBUTION = name
                break
            end
        end
        file:close()
    end

    -- If both files failed, return "Linux" as default
    ---Variable that stores the Linux distribution used
    if not env.LINUX_DISTRIBUTION then
        env.LINUX_DISTRIBUTION = "Linux"
    end
end

_G.ENV = env
