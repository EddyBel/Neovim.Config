local M = {}

local globals = require("globals")
local OPTIMIZE_CLEAN_BUFFERS_TIMER = globals.OPTIMIZE_CLEAN_BUFFERS_TIMER or 30   -- min
local OPTIMIZE_CLEAN_BUFFERS_LIMIT = globals.OPTIMIZE_CLEAN_BUFFERS_LIMIT or 1000 -- limit of buffers
local OPTIMIZE_CLEAN_BUFFERS_MAX = globals.OPTIMIZE_CLEAN_BUFFERS_MAX or 50       -- max limit of buffers
local title = "Optimize Buffers"
local timer_convert = OPTIMIZE_CLEAN_BUFFERS_TIMER * 60 * 1000

-- Function to get visible buffers in windows
local function get_visible_buffers()
    local visible_buffers = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        visible_buffers[buf] = true
    end
    return visible_buffers
end

-- Function to get loaded buffers
local function get_loaded_buffers()
    local buffers = vim.api.nvim_list_bufs()
    local loaded_buffers = {}
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            table.insert(loaded_buffers, buf)
        end
    end
    return loaded_buffers
end

local function get_number_open_buffers()
    local buffers = vim.api.nvim_list_bufs()
    local open_buffers = 0
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
            open_buffers = open_buffers + 1
        end
    end

    return open_buffers
end

-- Function to close unneeded buffers
-- Closes buffers that are not currently visible and not modified
M.close_unneeded_buffers = function()
    if ENV.NUMBER_OPEN_BUFFERS > 0 then
        local current_buf = vim.api.nvim_get_current_buf()
        local buffers = vim.api.nvim_list_bufs()
        local visible_buffers = get_visible_buffers()
        local closed_buffers_count = 0

        for _, buf in ipairs(buffers) do
            if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and not visible_buffers[buf] then
                local modified = vim.api.nvim_buf_get_option(buf, "modified")
                if not modified then
                    vim.api.nvim_buf_delete(buf, { force = true })
                    closed_buffers_count = closed_buffers_count + 1
                end
            end
        end

        NOTIFICATION.noti("Closed " .. closed_buffers_count .. " buffers", "info", title)
        UTILS.update_number_open_buffers()
    end
end


-- Function to save and close unneeded buffers
-- Saves modified buffers and then closes only non-visible buffers
M.save_and_close_unneeded_buffers = function()
    if ENV.NUMBER_OPEN_BUFFERS <= 0 then
        local current_buf = vim.api.nvim_get_current_buf()
        local buffers = get_loaded_buffers()
        local visible_buffers = get_visible_buffers()
        local closed_buffers_count = 0

        -- NOTIFICATION.noti("Saving and clearing the buffers ...", "info", title)

        for _, buf in ipairs(buffers) do
            if buf ~= current_buf and not visible_buffers[buf] then
                local modified = vim.api.nvim_buf_get_option(buf, "modified")
                if modified then
                    vim.api.nvim_buf_call(buf, function()
                        vim.cmd('write')
                    end)
                end
                vim.api.nvim_buf_delete(buf, { force = true })
                closed_buffers_count = closed_buffers_count + 1
            end
        end

        NOTIFICATION.noti("Saved and closed " .. closed_buffers_count .. " buffers", "info", title)
        UTILS.update_number_open_buffers()
    end
end


-- Function to remove inactive buffers
-- Closes buffers that have been inactive for a specified number of minutes
M.remove_inactive_buffers = function(inactive_minutes)
    if ENV.NUMBER_OPEN_BUFFERS > 0 then
        inactive_minutes = inactive_minutes or 30
        local current_time = os.time()
        local buffers = get_loaded_buffers()
        local removed_buffers_count = 0
        local inactive_seconds = inactive_minutes * 60


        for _, buf in ipairs(buffers) do
            local last_used = vim.fn.getbufvar(buf, "&lastused") or 0
            last_used = tonumber(last_used)

            if last_used and (current_time - last_used > inactive_seconds) then
                vim.api.nvim_buf_delete(buf, { force = true })
                removed_buffers_count = removed_buffers_count + 1
            end
        end

        NOTIFICATION.noti("Removed " .. removed_buffers_count .. " inactive buffers", "info", title)
        UTILS.update_number_open_buffers()
    end
end

-- Function to monitor performance
-- Displays the current memory usage
M.monitor_performance = function()
    local memory_usage_kb = collectgarbage("count")
    local memory_usage_mb = memory_usage_kb / 1024

    local system_info = vim.loop.os_uname()
    local system_hostname = vim.loop.os_gethostname()

    local message = string.format([[
Current memory usage:
- %.2f KB
- %.2f MB

System Information:
- OS: %s
- Release: %s
- Version: %s
- Hostname: %s
    ]], memory_usage_kb, memory_usage_mb, system_info.sysname, system_info.release, system_info.version,
        system_hostname)

    NOTIFICATION.noti(message, "info", title)
end

-- Function to manage buffers
-- Counts open buffers and closes the oldest ones if they exceed the limit
M.manage_buffers = function()
    local limit = OPTIMIZE_CLEAN_BUFFERS_MAX -- Change this value as needed
    local loaded_buffers = get_loaded_buffers()
    local manage_buffers_count = 0

    if ENV.NUMBER_OPEN_BUFFERS > limit then
        -- NOTIFICATION.noti("Managing buffers ...", "info", title)

        table.sort(loaded_buffers, function(a, b)
            return vim.fn.getbufinfo(a)[1].lastused < vim.fn.getbufinfo(b)[1].lastused
        end)

        for i = 1, 2 do
            vim.api.nvim_buf_delete(loaded_buffers[i], { force = true })
            manage_buffers_count = manage_buffers_count + 1
        end

        -- NOTIFICATION.noti("Managed buffers", "info", title)
        NOTIFICATION.noti("Managed " .. manage_buffers_count .. " buffers", "info", title)
        UTILS.update_number_open_buffers()
    end
end

-- Function to close hidden buffers
-- Closes buffers that are not visible and exceed the limit
M.close_hidden_buffers = function()
    local limit = OPTIMIZE_CLEAN_BUFFERS_LIMIT -- Change this value as needed
    local loaded_buffers = get_loaded_buffers()
    local clean_buffers_count = 0

    if ENV.NUMBER_OPEN_BUFFERS > limit then
        local visible_buffers = get_visible_buffers()
        -- NOTIFICATION.noti("Closing hidden buffers ...", "info", title)

        for _, buf in ipairs(loaded_buffers) do
            if not visible_buffers[buf] then
                vim.api.nvim_buf_delete(buf, { force = true })
                clean_buffers_count = clean_buffers_count + 1
            end
        end

        NOTIFICATION.noti("Closed " .. clean_buffers_count .. " hidden buffers", "info", title)
        UTILS.update_number_open_buffers()
    end
end

-- Set up the timer to execute the function every 30 minutes
M.setup_timer = function()
    local timer = vim.loop.new_timer()
    timer:start(timer_convert, timer_convert, vim.schedule_wrap(M.close_unneeded_buffers))
end

-- Expose functions to Neovim commands
_G.OPTIMIZE = M

vim.cmd([[command! OptimizeCloseBuffers lua OPTIMIZE.close_unneeded_buffers()]])
vim.cmd([[command! OptimizeSaveAndClose lua OPTIMIZE.save_and_close_unneeded_buffers()]])
vim.cmd([[command! OptimizeMonitor lua OPTIMIZE.monitor_performance()]])
vim.cmd([[command! OptimizeRemoveInactive lua OPTIMIZE.remove_inactive_buffers(30)]]) -- 30 minutes of inactivity

return M
