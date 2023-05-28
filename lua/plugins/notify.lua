return {
    "rcarriga/nvim-notify",
    -- lazy = true,
    event = "VeryLazy",
    config = function()
        local notify = require "notify"
        -- this for transparency
        notify.setup {
            background_colour = "#000000",
        }
        -- this overwrites the vim notify function
        vim.notify = notify.notify
    end,
}
