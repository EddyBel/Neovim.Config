local globals = require("globals")

return {
    -- {
    --     -- messages, cmdline and the popupmenu
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         lsp = { signature = { enabled = false } },
    --         cmdline = {
    --             enabled = true,         -- enables the Noice cmdline UI
    --             view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    --             opts = {},              -- global options for the cmdline. See section on views
    --             ---@type table<string, CmdlineFormat>
    --             format = {
    --                 -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
    --                 -- view: (default is cmdline view)
    --                 -- opts: any options passed to the view
    --                 -- icon_hl_group: optional hl_group for the icon
    --                 -- title: set to anything or empty string to hide
    --                 cmdline = { pattern = "^:", icon = "", lang = "vim" },
    --                 search_down = {
    --                     kind = "search",
    --                     pattern = "^/",
    --                     icon = " ",
    --                     lang = "regex"
    --                 },
    --                 search_up = {
    --                     kind = "search",
    --                     pattern = "^%?",
    --                     icon = " ",
    --                     lang = "regex"
    --                 },
    --                 filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
    --                 lua = {
    --                     pattern = {
    --                         "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*"
    --                     },
    --                     icon = "",
    --                     lang = "lua"
    --                 },
    --                 help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
    --                 input = { view = "cmdline_input", icon = "󰥻 " } -- Used by input()
    --                 -- lua = false, -- to disable a format, set to `false`
    --             },
    --             messages = {
    --                 -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    --                 -- This is a current Neovim limitation.
    --                 enabled = true,             -- enables the Noice messages UI
    --                 view = "notify",            -- default view for messages
    --                 view_error = "notify",      -- view for errors
    --                 view_warn = "notify",       -- view for warnings
    --                 view_history = "messages",  -- view for :messages
    --                 view_search = "virtualtext" -- view for search count messages. Set to `false` to disable
    --             }
    --         }
    --         -- add any options here
    --     },
    --     dependencies = {            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim", -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify"
    --     }
    -- }, 
    
    {
    -- Dims lines that are out of focus
    "folke/twilight.nvim",
    keys = {
        {
            "<Space>z",
            "<cmd>ZenModeToggle<cr>",
            mode = "n",
            desc = "Toggle Twilight"

        }
    },
    opts = { context = 20 }
}, {
    "folke/zen-mode.nvim",
    keys = {
        {
            "<Space>z",
            "<cmd>ZenModeToggle<cr>",
            mode = "n",
            desc = "Toggle Zen Mode"

        }
    },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
}, {
    "yamatsum/nvim-cursorline",
    event = "VeryLazy",
    opts = {
        cursorline = { enable = true, timeout = 0, number = false },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true }
        }
    }
}
}
