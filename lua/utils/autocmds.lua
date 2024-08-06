--- Scripts for run plugins when necessary
--- @module autocmds

local plugin_tailwind = "luckasRanarison/tailwind-tools.nvim"

function is_loaded(plugin_name)
    local plugins = require("lazy.core.config").plugins
    return plugins[plugin_name] and plugins[plugin_name]._.loaded ~= nil
end

-- Configuración del autocmd para cargar el plugin cuando el servidor LSP de Tailwind CSS se inicializa
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        local clients = vim.lsp.get_active_clients()
        for _, client in pairs(clients) do
            if client.name == "tailwindcss" then
                -- Verifica si el plugin está cargado y, si no, cárgalo
                local ok, lazy = pcall(require, 'lazy')
                lazy.load({ plugins = { "tailwind-tools.nvim" } })
                -- if not is_loaded(plugin_tailwind) then
                --     if ok then
                --         lazy.load({ plugins = { plugin_tailwind } })
                --     else
                --         vim.notify("Error al cargar lazy.nvim")
                --     end
                -- end
                break
            end
        end
    end,
})
