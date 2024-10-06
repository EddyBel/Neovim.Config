local globals = require("globals")

--- LOAD VALUES DINAMICS

-- Update the number of buffers opened in the current session
vim.api.nvim_create_autocmd("BufEnter",
                            {callback = UTILS.update_number_open_buffers})

-- LSP autocommands

-- Función para mostrar notificaciones LSP
local function on_lsp_server_loaded(server_name)
    local message = server_name .. " Server Loaded"
    vim.notify(message, "info", {
        icon = "",
        title = "LSP",
        timeout = 3000 -- Notificación visible durante 3 segundos
    })
end

-- Configuración del autocomando para LSP
if GLOBALS.LSP_ALERTS_RUNNING then
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client then on_lsp_server_loaded(client.name) end
        end
    })
end

--- Functions for optimize the buffers

local OPTIMIZE_CLEAN_BUFFERS_MODE = globals.OPTIMIZE_CLEAN_BUFFERS_MODE
local OPTIMIZE_FUNCTIONS = require("lib.clean-optimizate")

if OPTIMIZE_CLEAN_BUFFERS_MODE == "timer" then
    vim.api.nvim_create_autocmd("VimEnter",
                                {callback = OPTIMIZE_FUNCTIONS.setup_timer})
elseif OPTIMIZE_CLEAN_BUFFERS_MODE == "max" then
    vim.api.nvim_create_autocmd("BufEnter",
                                {callback = OPTIMIZE_FUNCTIONS.manage_buffers})
elseif OPTIMIZE_CLEAN_BUFFERS_MODE == "limit" then
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = OPTIMIZE_FUNCTIONS.close_hidden_buffers
    })
end

--- Functions autoupdate the configuration
local function update_nvim_config()
    local is_windows = ENV.OS == ENV.WINDOWS
    local nvim_config_path

    if is_windows then
        nvim_config_path = vim.fn.expand('$HOME\\AppData\\Local\\nvim')
    else
        nvim_config_path = vim.fn.expand('~/.config/nvim')
    end

    local repo_url = "https://github.com/EddyBel/Neovim.Config.git"

    local is_git_repo =
        vim.fn.empty(vim.fn.glob(nvim_config_path .. "/.git")) == 0

    if not is_git_repo then
        print(
            "El directorio de configuración no es un repositorio Git. Clonando...")
        local clone_result = vim.fn.system(
                                 'git clone --branch main ' .. repo_url .. ' ' ..
                                     nvim_config_path)
        print(clone_result)
        return
    end

    local result = vim.fn.system('cd ' .. nvim_config_path ..
                                     ' && git fetch origin main && git diff --quiet HEAD origin/main && echo 0 || echo 1')
    print(result)

    -- Interpretar el resultado adecuadamente
    if result:find("1") then
        local respuesta = vim.fn.input(
                              "Hay actualizaciones disponibles. ¿Deseas actualizarlas? (s/n): ")
        if respuesta:lower() == "s" then
            local update_result = vim.fn.system(
                                      'cd ' .. nvim_config_path ..
                                          ' && git pull origin main')
            print("Actualización completada:\n" .. update_result)
        else
            print("No se realizaron actualizaciones.")
        end
    else
        print("No hay actualizaciones disponibles.")
    end
end

if (GLOBALS.AUTO_UPDATE) then
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function() update_nvim_config() end
    })
end

