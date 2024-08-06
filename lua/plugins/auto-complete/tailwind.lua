-- Función para verificar si el plugin está cargado
return {
    "luckasRanarison/tailwind-tools.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        document_color = {
            enabled = true, -- can be toggled by commands
            kind = "inline", -- "inline" | "foreground" | "background"
            inline_symbol = "󰝤 ", -- only used in inline mode
            debounce = 200, -- in milliseconds, only applied in insert mode
        },
        conceal = {
            enabled = false, -- can be toggled by commands
            min_length = nil, -- only conceal classes exceeding the provided length
            symbol = "󱏿", -- only a single character is allowed
            highlight = { -- extmark highlight options, see :h 'highlight'
                fg = "#38BDF8",
            },
        },
        -- see the extension section to learn more
        extension = {
            queries = {}, -- a list of filetypes having custom `class` queries
            patterns = {  -- a map of filetypes to Lua pattern lists
                -- exmaple:
                -- rust = { "class=[\"']([^\"']+)[\"']" },
                -- javascript = { "clsx%(([^)]+)%)" },
            },
        },
    } -- your configuration
}
