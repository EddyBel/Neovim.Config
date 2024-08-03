return {
    -- tailwind-tools.lua
    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            document_color = {
                enabled = true, -- can be toggled by commands
                kind = "inline", -- "inline" | "foreground" | "background"
                inline_symbol = "󰝤 ", -- only used in inline mode
                debounce = 200, -- in milliseconds, only applied in insert mode
            },
            conceal = {
                enabled = true, -- can be toggled by commands
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
    },
    {
        "terrortylor/nvim-comment",
        event = "VeryLazy",
        config = function()
            require('nvim_comment').setup({
                -- Linters prefer comment and line to have a space in between markers
                marker_padding = true,
                -- should comment out empty or whitespace only lines
                comment_empty = true,
                -- trim empty comment whitespace
                comment_empty_trim_whitespace = true,
                -- Should key mappings be created
                create_mappings = true,
                -- Normal mode mapping left hand side
                line_mapping = "gcc",
                -- Visual/Operator mapping left hand side
                operator_mapping = "gc",
                -- text object mapping, comment chunk,,
                comment_chunk_text_object = "ic",
                -- Hook function to call before commenting takes place
                hook = nil
            })
        end
    }, -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true }
    }, -- add symbols-outline
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = {
            { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" }
        },
        config = true
    }, {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
        {
            "gpd",
            "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
            noremap = true,
            desc = "goto preview definition"
        }, {
        "gpD",
        "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
        noremap = true,
        desc = "goto preview declaration"
    }, {
        "gpi",
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        noremap = true,
        desc = "goto preview implementation"
    }, {
        "gpy",
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        noremap = true,
        desc = "goto preview type definition"
    }, {
        "gpr",
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        noremap = true,
        desc = "goto preview references"
    }, {
        "gP",
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        noremap = true,
        desc = "close all preview windows"
    }
    }
}, {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    config = function()
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                -- fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                -- hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                -- todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                -- note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })
    end
},
}
