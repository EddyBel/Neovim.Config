local globals = require("globals")
local COPILOT = globals.COPILOT
local COPILOT_IN_LINE = globals.COPILOT_IN_LINE

return {
    {
        ---This plugin allows you to use supermaven's AI autocomplete.
        -- Link: https://supermaven.com/
        "supermaven-inc/supermaven-nvim",
        event = "VeryLazy",
        build = ":SupermavenUseFree",
        enabled = function()
            return COPILOT == ENV.COPILOT_SUPERMAVEN
        end,
        opts = {
            keymaps = {
                accept_suggestion = KEYMAPS.assistant_accept_suggestion[2],
                clear_suggestion = KEYMAPS.assistant_clear_suggestion[2],
                accept_word = KEYMAPS.assistant_accept_word[2]
            },
            -- ignore_filetypes = {cpp = true},
            -- color = {suggestion_color = "#ffffff", cterm = 244}
            -- log_level = "info", -- set to "off" to disable logging completely
            disable_inline_completion = not COPILOT_IN_LINE, -- disables inline completion for use with cmp
            disable_keymaps = not COPILOT_IN_LINE            -- disables built in keymaps for more manual control
        },
    },
    {
        ---Plugin for using codeium in neovim together with cmp
        -- Link: https://codeium.com/
        "Exafunction/codeium.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
        build = ":Codeium Auth",
        enabled = function()
            return COPILOT == ENV.COPILOT_CODEIUM
        end,
        config = function() require("codeium").setup({ enable_chat = true }) end
    }, {
    -- "Exafunction/codeium.vim",
    -- config = function()
    --     vim.keymap.set("i", "<C-g>", function()
    --         return vim.fn["codeium#Accept"]()
    --     end, { expr = true })
    --     vim.keymap.set("i", "<C-l>", function()
    --         return vim.fn["codeium#CycleCompletions"](1)
    --     end, { expr = true })
    --     vim.keymap.set("i", "<C-M>", function()
    --         return vim.fn["codeium#Complete"]()
    --     end, { expr = true })
    --     vim.keymap.set("i", "<C-x>", function()
    --         return vim.fn["codeium#Clear"]()
    --     end, { expr = true })
    -- end,
},
    {
        ---Plugin for using github copilot in neovim
        ---Link: https://github.com/github/copilot.vim
        "github/copilot.vim",
        event = "VeryLazy",
        enabled = function()
            return COPILOT == ENV.COPILOT_GITHUB_COPILOT
        end
    }
}
--
