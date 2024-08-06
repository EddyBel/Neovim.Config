local function NotificationOnLoad()
    local plugin = "My Awesome Plugin"

    vim.notify("This is an error message.\nSomething went wrong!", "error", {
        title = plugin,

        on_open = function()
            vim.notify("Attempting recovery.", vim.log.levels.WARN,
                { title = plugin })

            local timer = vim.loop.new_timer()

            timer:start(2000, 0, function()
                vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
                    title = plugin,
                    timeout = 3000,
                    on_close = function()
                        vim.notify("Problem solved", nil, { title = plugin })
                        vim.notify("Error code 0x0395AF", 1, { title = plugin })
                    end
                })
            end)
        end
    })
end


local M = {}

M.noti = function(message, type, title)
    local ok, notify = pcall(require, "notify")
    if ok then
        notify(message, type, { title = title })
    else
        print(message)
    end
end

_G.NOTIFICATION = M

return M
