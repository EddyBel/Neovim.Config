local globals = require("globals")

--- LOAD VALUES DINAMICS

-- Update the number of buffers opened in the current session
vim.api.nvim_create_autocmd("BufEnter", {
    callback = UTILS.update_number_open_buffers })

-- LSP autocommands

-- Función para mostrar notificaciones LSP
local function on_lsp_server_loaded(server_name)
    local message = server_name .. " Server Loaded"
    vim.notify(message, "info", {
        icon = "",
        title = "LSP",
        timeout = 3000, -- Notificación visible durante 3 segundos
    })
end

-- Configuración del autocomando para LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client then
            on_lsp_server_loaded(client.name)
        end
    end,
})


--- Functions for optimize the buffers

local OPTIMIZE_CLEAN_BUFFERS_MODE = globals.OPTIMIZE_CLEAN_BUFFERS_MODE
local OPTIMIZE_FUNCTIONS = require("lib.clean-optimizate")

if OPTIMIZE_CLEAN_BUFFERS_MODE == "timer" then
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = OPTIMIZE_FUNCTIONS.setup_timer })
elseif OPTIMIZE_CLEAN_BUFFERS_MODE == "max" then
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = OPTIMIZE_FUNCTIONS.manage_buffers })
elseif OPTIMIZE_CLEAN_BUFFERS_MODE == "limit" then
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = OPTIMIZE_FUNCTIONS.close_hidden_buffers })
end
