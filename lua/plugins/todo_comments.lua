return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
    event = 'VeryLazy',
    config = true,
    opts = {
        signs = TODO_ICONS.signs, -- show icons in the signs column
        sign_priority = 8,        -- sign priority

        keywords = {
            FIX = { icon = TODO_ICONS.fix .. " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
            TODO = { icon = TODO_ICONS.todo .. " ", color = "info" },
            HACK = { icon = TODO_ICONS.hack .. " ", color = "warning" },
            WARN = { icon = TODO_ICONS.warn .. " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = TODO_ICONS.perf .. " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = TODO_ICONS.note .. " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = TODO_ICONS.test .. " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            EXAM = { icon = TODO_ICONS.exam .. " ", color = "info", alt = { "EXAMPLE" } },
        },

        gui_style = {
            fg = "NONE", -- The gui style to use for the fg highlight group.
            bg = "BOLD", -- The gui style to use for the bg highlight group.
        },

        merge_keywords = true, -- when true, custom keywords will be merged with the defaults

        highlight = {
            multiline = true,          -- enable multine todo comments
            multiline_pattern = "^.",  -- lua pattern to match the next multiline from the start of the matched keyword
            multiline_context = 10,    -- extra lines that will be re-evaluated when changing a line
            before = "fg",             -- "fg" or "bg" or empty
            keyword = TODO_ICONS.type, -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
            after = "fg",              -- "fg" or "bg" or empty
            pattern = TODO_PATTERN,    -- pattern or table of patterns, used for highlighting (vim regex)
            comments_only = true,      -- uses treesitter to match keywords in comments only
            max_line_len = 400,        -- ignore lines longer than this
            exclude = {},              -- list of file types to exclude highlighting
        },

        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            pattern = TODO_PATTERN, -- ripgrep regex
        },
    }
}
