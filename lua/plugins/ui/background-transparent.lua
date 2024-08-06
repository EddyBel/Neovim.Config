local globals = require("globals")
local BACKGROUND_TRANSPARENT = globals.BACKGROUND_TRANSPARENT

return {
    'xiyaowong/transparent.nvim',
    config = function()
        if BACKGROUND_TRANSPARENT then
            vim.cmd("TransparentEnable")
        else
            vim.cmd("TransparentDisable")
        end
    end
}
