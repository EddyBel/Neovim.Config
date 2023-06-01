return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    cond = function() return vim.fn.isdirectory(".git") == 1 end,
    config = function()
        require('gitsigns').setup {
            signs                        = {
                add          = { text = GIT_SYMBOLS.add },
                change       = { text = GIT_SYMBOLS.change },
                delete       = { text = GIT_SYMBOLS.delete },
                topdelete    = { text = GIT_SYMBOLS.topdelete },
                changedelete = { text = GIT_SYMBOLS.changedelete },
                untracked    = { text = GIT_SYMBOLS.untracked },
            },
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked          = true,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm                         = {
                enable = false
            },
        }

        if GIT_INFO then
            vim.cmd('silent! Gitsigns toggle_current_line_blame')
        end
    end,
}
