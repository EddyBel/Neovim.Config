return {
    {
        -- messages, cmdline and the popupmenu
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim", -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify"
        }
    }, {
        "rcarriga/nvim-notify",
        -- lazy = true,
        event = "VeryLazy",
        opts = {},
        config = function()
            vim.notify = require("notify")
            vim.notify(GRETING_MESSAGE, "info",
                       {title = "Greeting", timeout = 1000})
        end
    }, {
        -- Dims lines that are out of focus
        "folke/twilight.nvim",
        event = "VeryLazy",
        opts = {context = 20}
    }, {
        "yamatsum/nvim-cursorline",
        event = "VeryLazy",
        opts = {
            cursorline = {enable = true, timeout = 0, number = false},
            cursorword = {
                enable = true,
                min_length = 3,
                hl = {underline = true}
            }
        }
    }
}
