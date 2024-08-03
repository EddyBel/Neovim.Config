local M = {}

local minutes = WAIT_MINUTES_TO_CLEAR_BUFFERS or 30 -- min
local timer_convert = minutes * 60 * 1000

-- Define la función
M.close_unneeded_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local closed_buffers_count = 0
    local label = "Resource M"

    print("Clearing the buffers ...")

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            local modified = vim.api.nvim_buf_get_option(buf, "modified")
            if not modified then
                vim.api.nvim_buf_delete(buf, {force = true})
                closed_buffers_count = closed_buffers_count + 1
            end
        end
    end

    -- Usar vim.notify si está disponible, de lo contrario usar print
    if vim.notify then
        vim.notify("Closed " .. closed_buffers_count .. " buffers",
                   vim.log.levels.INFO, {title = label})
    else
        print("Closed " .. closed_buffers_count .. " buffers")
    end
end

M.save_and_close_unneeded_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local closed_buffers_count = 0
    local label = "Resource M"

    print("Saving and clearing the buffers ...")

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            local modified = vim.api.nvim_buf_get_option(buf, "modified")
            if modified then
                vim.api.nvim_buf_call(buf, function()
                    vim.cmd('write')
                end)
            end
            vim.api.nvim_buf_delete(buf, {force = true})
            closed_buffers_count = closed_buffers_count + 1
        end
    end

    if vim.notify then
        vim.notify("Saved and closed " .. closed_buffers_count .. " buffers",
                   vim.log.levels.INFO, {title = label})
    else
        print("Saved and closed " .. closed_buffers_count .. " buffers")
    end
end

M.remove_inactive_buffers = function(inactive_minutes)
    inactive_minutes = inactive_minutes or 30
    local current_time = os.time()
    local buffers = vim.api.nvim_list_bufs()
    local removed_buffers_count = 0
    local label = "Resource M"
    local inactive_seconds = inactive_minutes * 60

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local last_used = vim.fn.getbufvar(buf, "&lastused") or 0
            -- Convertir last_used a número
            last_used = tonumber(last_used)

            if last_used and (current_time - last_used > inactive_seconds) then
                vim.api.nvim_buf_delete(buf, {force = true})
                removed_buffers_count = removed_buffers_count + 1
            end
        end
    end

    if vim.notify then
        vim.notify("Removed " .. removed_buffers_count .. " inactive buffers",
                   vim.log.levels.INFO, {title = label})
    else
        print("Removed " .. removed_buffers_count .. " inactive buffers")
    end
end

M.monitor_performance = function()
    local memory_usage = collectgarbage("count")
    local label = "Resource Monitor"

    if vim.notify then
        vim.notify("Current memory usage: " .. memory_usage .. " KB",
                   vim.log.levels.INFO, {title = label})
    else
        print("Current memory usage: " .. memory_usage .. " KB")
    end
end

-- Configurar el temporizador para ejecutar la función cada 30 minutos
local function setup_timer()
    local timer = vim.loop.new_timer()
    timer:start(timer_convert, timer_convert,
                vim.schedule_wrap(M.close_unneeded_buffers))
end

-- Ejecutar la configuración del temporizador al iniciar Neovim
vim.api.nvim_create_autocmd("VimEnter", {callback = setup_timer})

-- Exponer la función a comandos de Neovim
_G.OPTIMIZE = M

vim.cmd([[command! CleanAllBuffers lua OPTIMIZE.close_unneeded_buffers()]])
vim.cmd(
    [[command! SaveAndCleanAllBuffers lua OPTIMIZE.save_and_close_unneeded_buffers()]])
vim.cmd([[command! MonitorPerformance lua OPTIMIZE.monitor_performance()]])
vim.cmd(
    [[command! RemoveInactiveBuffers lua OPTIMIZE.remove_inactive_buffers(30)]]) -- 30 minutos de inactividad

