return {
    "rcarriga/nvim-notify",
    -- lazy = true,
    event = "VeryLazy",
    opts = {},
    config = function()
        vim.notify = require("notify")
        vim.notify(GRETING_MESSAGE, "info", {title = "Greeting", timeout = 1000})
    end
}
