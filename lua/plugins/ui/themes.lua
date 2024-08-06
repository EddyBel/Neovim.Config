-- This file contains the list of theme plugins to customize Neovim.
-- Each theme can have conditions specified through the `enabled` property.
-- This property allows only the theme you want to use to be installed or loaded,
-- ignoring the others. This improves the performance of Neovim by avoiding unnecessary theme loading.

-- To add a new theme, simply add it to the `themes` list and,
-- preferably, set a condition on the `enabled` property to
-- to be loaded selectively by modifying a single variable.

local globals = require("globals")
local THEME = globals.THEME -- variable to store the theme name
local BACKGROUND_TRANSPARENT = globals.BACKGROUND_TRANSPARENT

return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        enabled = function()
            return THEME == "kanagawa" or THEME == "kanagawa-wave" or THEME == "kanagawa-lotus" or
                THEME == "kanagawa-dragon"
        end,
        opts = {
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,   -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {             -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} }
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",    -- Load "wave" theme when 'background' option is not set
            background = {     -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus"
            }
        },
        config = function()
            -- vim.cmd("colorscheme kanagawa-wave")
            -- vim.cmd("colorscheme kanagawa-dragon")
            -- vim.cmd("colorscheme kanagawa-lotus")
            if THEME == "kanagawa" then
                vim.cmd([[colorscheme kanagawa]])
            elseif THEME == "kanagawa-wave" then
                vim.cmd([[colorscheme kanagawa-wave]])
            elseif THEME == "kanagawa-lotus" then
                vim.cmd([[colorscheme kanagawa-lotus]])
            elseif THEME == "kanagawa-dragon" then
                vim.cmd([[colorscheme kanagawa-dragon]])
            else
                vim.cmd([[colorscheme kanagawa]])
            end
        end
    }, {
    "catppuccin/nvim",
    enabled = function()
        return THEME == "catppuccin" or THEME == "catppuccin-latte" or THEME == "catppuccin-frappe" or
            THEME == "catppuccin-macchiato" or THEME == "catppuccin-mocha"
    end,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- transparent_background = BACKGROUND_TRANSPARENT, -- disables setting the background color.
        })
        -- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
        if THEME == "catpuccin" then
            vim.cmd([[colorscheme catppuccin]])
        elseif THEME == "catpuccin-latte" then
            vim.cmd([[colorscheme catppuccin-latte]])
        elseif THEME == "catpuccin-frappe" then
            vim.cmd([[colorscheme catppuccin-frappe]])
        elseif THEME == "catpuccin-macchiato" then
            vim.cmd([[colorscheme catppuccin-macchiato]])
        elseif THEME == "catpuccin-mocha" then
            vim.cmd([[colorscheme catppuccin-mocha]])
        else
            vim.cmd([[colorscheme catppuccin]])
        end
    end
}, {
    "rose-pine/neovim",
    enabled = function()
        return THEME == "rose-pine" or THEME == "rose-pine-main" or THEME == "rose-pine-moon" or
            THEME == "rose-pine-dawn"
    end,
    priority = 1000,
    name = "rose-pine",
    opts = {},
    config = function()
        -- vim.cmd("colorscheme rose-pine")
        -- vim.cmd("colorscheme rose-pine-main")
        -- vim.cmd("colorscheme rose-pine-moon")
        -- vim.cmd("colorscheme rose-pine-dawn")

        if THEME == "rose-pine" then
            vim.cmd([[colorscheme rose-pine]])
        elseif THEME == "rose-pine-main" then
            vim.cmd([[colorscheme rose-pine-main]])
        elseif THEME == "rose-pine-moon" then
            vim.cmd([[colorscheme rose-pine-moon]])
        elseif THEME == "rose-pine-dawn" then
            vim.cmd([[colorscheme rose-pine-dawn]])
        else
            vim.cmd([[colorscheme rose-pine]])
        end
    end
}, {
    "folke/tokyonight.nvim",
    priority = 1000,
    enabled = function()
        return THEME == "tokyonight" or THEME == "tokyonight-night" or THEME == "tokyonight-storm" or
            THEME == "tokyonight-day" or THEME == "tokyonight-moon"
    end,
    opts = {},
    config = function()
        -- colorscheme tokyonight
        -- colorscheme tokyonight-night
        -- colorscheme tokyonight-storm
        -- colorscheme tokyonight-day
        -- colorscheme tokyonight-moon

        if THEME == "tokyonight" then
            vim.cmd([[colorscheme tokyonight]])
        elseif THEME == "tokyonight-night" then
            vim.cmd([[colorscheme tokyonight-night]])
        elseif THEME == "tokyonight-storm" then
            vim.cmd([[colorscheme tokyonight-storm]])
        elseif THEME == "tokyonight-day" then
            vim.cmd([[colorscheme tokyonight-day]])
        elseif THEME == "tokyonight-moon" then
            vim.cmd([[colorscheme tokyonight-moon]])
        else
            vim.cmd([[colorscheme tokyonight]])
        end
    end
}, {
    "ellisonleao/gruvbox.nvim",
    enabled = function()
        return THEME == "gruvbox"
    end,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd([[colorscheme gruvbox]])
    end
}, {
    "neanias/everforest-nvim",
    enabled = function()
        return THEME == "everforest"
    end,
    version = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
        require("everforest").setup({
            -- Your config here
        })
        if THEME == "everforest" then
            vim.cmd([[colorscheme everforest]])
        end
    end,
}, {
    'shaunsingh/nord.nvim',
    priority = 1000,
    enabled = function() return THEME == "nord" end,
    config = function()
        vim.cmd([[colorscheme nord]])
    end
}
}
