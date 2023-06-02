return {
    'mawkler/modicator.nvim',
    -- event = "VeryLazy",
    init = function()
        -- These are required for Modicator to work
        vim.o.cursorline = true
        vim.o.number = true
        vim.o.termguicolors = true
    end,
    config = function()
        local modicator = require("modicator")
        modicator.setup({
            -- Show warning if any required option is missing
            show_warnings = true,
            highlights = {
                -- Default options for bold/italic. You can override these individually
                -- for each mode if you'd like as seen below.
                defaults = {
                    foreground = modicator.get_highlight_fg('CursorLineNr'),
                    background = modicator.get_highlight_bg('CursorLineNr'),
                    bold = true,
                    italic = true
                },
                -- Color and bold/italic options for each mode. You can add a bold and/or
                -- italic key pair to override the default highlight for a specific mode if
                -- you would like.
                modes = {
                    ['n']   = {
                        foreground = COLOR_LINE.normal,
                    },
                    ['i']   = {
                        foreground = COLOR_LINE.insert,
                    },
                    ['v']   = {
                        foreground = COLOR_LINE.visual,
                    },
                    ['V']   = {
                        foreground = COLOR_LINE.visual_line,
                    },
                    ['�'] = { -- This symbol is the ^V character
                        foreground = COLOR_LINE.insert_code,
                    },
                    ['s']   = {
                        foreground = COLOR_LINE.select,
                    },
                    ['S']   = {
                        foreground = COLOR_LINE.select_line,
                    },
                    ['R']   = {
                        foreground = COLOR_LINE.replacement,
                    },
                    ['c']   = {
                        foreground = COLOR_LINE.command,
                    },
                },
            },
        })
    end,
}
