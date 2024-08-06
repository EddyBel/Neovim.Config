local globals = require("globals")

return {
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        -- opts = { timeout = 3000, render = "compact", },
        config = function()
            local grettings = globals.GRETING_MESSAGE

            vim.notify = require("notify")
            vim.notify.setup({
                background_colour = "#000000",
                render = "compact",
                timeout = 2000,
            })
            vim.notify(grettings, "info", {
                icon = "󰫢",
                title = "Hi!",
                timeout = 1000
            })
        end
    },
    -- {
    --     'mrded/nvim-lsp-notify',
    --     dependencies = { 'rcarriga/nvim-notify' },
    --     config = function()
    --         require('lsp-notify').setup({
    --             icons = {
    --                 spinner = { '|', '/', '-', '\\' }, -- `= false` to disable only this icon
    --                 done = '!'                         -- `= false` to disable only this icon
    --             }
    --         })
    --     end
    -- }
}
