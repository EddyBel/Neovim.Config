---This plugin allows you to use supermaven's AI autocomplete.
-- Link: https://supermaven.com/
local supermaven = {
    "supermaven-inc/supermaven-nvim",
    build = ":SupermavenUseFree",
    opts = {
        keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>"
        }
        -- ignore_filetypes = {cpp = true},
        -- color = {suggestion_color = "#ffffff", cterm = 244}
        -- log_level = "info", -- set to "off" to disable logging completely
        -- disable_inline_completion = false, -- disables inline completion for use with cmp
        -- disable_keymaps = false -- disables built in keymaps for more manual control
    },
    config = function() require("supermaven-nvim").setup({}) end
}

---Plugin for using codeium in neovim together with cmp
-- Link: https://codeium.com/
local codeium = {
    "Exafunction/codeium.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp"},
    build = ":Codeium Auth",
    config = function() require("codeium").setup({enable_chat = true}) end
}

local github_copilot = {"github/copilot.vim"}

-- Función para obtener la lista de plugins según el valor de la variable
local function get_plugins()
    local plugins = {}
    local allString = "All"

    if COPILOT == ENV.COPILOT_CODEIUM or COPILOT == allString then
        table.insert(plugins, codeium)
    elseif COPILOT == ENV.COPILOT_SUPERMAVEN or COPILOT == allString then
        table.insert(plugins, supermaven)
    elseif COPILOT == ENV.COPILOT_GITHUB_COPILOT or COPILOT == allString then
        table.insert(plugins, github_copilot)
    end

    return plugins
end

return get_plugins()
