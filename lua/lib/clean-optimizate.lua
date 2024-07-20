local optimizer = {}

local minutes = WAIT_MINUTES_TO_CLEAR_BUFFERS or 30 -- min
local timer_convert = minutes * 60 * 1000

-- Define la función
optimizer.close_unneeded_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local closed_buffers_count = 0
    local label = "Resource Optimizer"

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

optimizer.save_and_close_unneeded_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()
    local closed_buffers_count = 0
    local label = "Resource Optimizer"

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

optimizer.remove_inactive_buffers = function(inactive_minutes)
    local current_time = os.time()
    local buffers = vim.api.nvim_list_bufs()
    local removed_buffers_count = 0
    local label = "Resource Optimizer"
    local inactive_seconds = inactive_minutes * 60

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local last_used = vim.fn.getbufvar(buf, "&lastused") or 0
            if current_time - last_used > inactive_seconds then
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

optimizer.monitor_performance = function()
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
                vim.schedule_wrap(optimizer.close_unneeded_buffers))
end

-- Ejecutar la configuración del temporizador al iniciar Neovim
vim.api.nvim_create_autocmd("VimEnter", {callback = setup_timer})

-- Exponer la función a comandos de Neovim
_G.OPTIMIZER = optimizer

vim.cmd([[command! CleanAllBuffers lua OPTIMIZER.close_unneeded_buffers()]])
vim.cmd(
    [[command! SaveAndCleanAllBuffers lua OPTIMIZER.save_and_close_unneeded_buffers()]])
vim.cmd([[command! MonitorPerformance lua OPTIMIZER.monitor_performance()]])
vim.cmd(
    [[command! RemoveInactiveBuffers lua OPTIMIZER.remove_inactive_buffers(30)]]) -- 30 minutos de inactividad

