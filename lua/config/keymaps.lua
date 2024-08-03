_G.KEYMAPS = {
    --  Clears whatever the Visial-vim plugin does.
    escape = {{'i', 'n'}, "<Esc>", "<Esc><cmd>:VMClear <BAR> :nohl <CR>"},
    -- Close the buffer
    close = {{'n'}, 'q', "<cmd>:q<CR>"},
    -- Force the buffer to close
    close_force = {{'n'}, '<leader>qq', "<cmd>:q!<CR>"},

    ------------------------------> KEYBOARD SHORTCUTS FOR TEXT MANIPULATION <-----------------------------------------------

    -- Copy to document
    copy = {{'v'}, '<C-c>', 'y'},
    -- Paste into document
    paste = {{'i'}, '<C-v>', '<Esc>pi'},
    -- Cut text
    cut = {{'v'}, '<C-x>', 'd'},
    -- Select all text in document
    select_all = {{'n', 'v'}, '<C-a>', '<Esc>gg0vG$'},
    -- Copy the line at the bottom of the document
    copy_down_line = {{'n'}, '<S-Down>', 'yyp'},
    -- Moves the line to the bottom of the following line
    move_down_line = {{'n'}, '<A-Down>', '<cmd>:m+1<CR>'},
    -- Move line to top of next line
    mode_up_line = {{'n'}, '<A-Up>', '<cmd>:m-2<CR>'},
    -- Undo the changes
    undo_change = {{'n', 'i'}, '<C-z>', '<cmd>:undo<CR>'},
    -- Rebuild changes
    rebuild_change = {{'n', 'i'}, '<C-y>', '<cmd>:redo<CR>'},
    -- Comment out the line where you are located
    comment_line = {{'n', 'i'}, '<C-p>', '<cmd>:CommentToggle<CR>'},
    -- Comment all selected lines (Visual)
    cooment_lines = {{'v'}, '<C-p>', '<S-:>CommentToggle<CR>'},

    ------------------------------> KEYBOARD SHORTCUTS FOR FILES AND BUFFERS <-----------------------------------------------

    -- Save the buffer
    save = {{'n', 'i'}, '<C-s>', "<cmd>:w<CR>"},
    -- Move cursor to the left window
    move_left_window = {{'n', 'i'}, '<C-h>', "<cmd>:wincmd h<CR>"},
    -- Move cursor to the right window
    move_right_window = {{'n', 'i'}, '<C-l>', "<cmd>:wincmd l<CR>"},
    -- Move cursor to the up window
    move_up_window = {{'n', 'i'}, '<C-k>', "<cmd>:wincmd k<CR>"},
    -- Move cursor to the down window
    move_down_window = {{'n', 'i'}, '<C-j>', "<cmd>:wincmd j<CR>"},
    -- Move to previous buffer (left)
    move_previous_buffer = {{'n'}, '<C-h><C-h>', "<cmd>:bprevious<CR>"},
    -- Move to the next buffer (right)
    move_next_buffer = {{'n'}, '<C-l><C-l>', "<cmd>:bnext<CR>"},
    -- Close the tab or buffer you are in.
    close_buffer = {{'n'}, '<C-q>', "<cmd>:Bdelete<CR>"},
    -- Open new window with current buffer
    new_right_window = {{'n'}, '<leader>nr', "<cmd>:vsplit<CR>"},
    -- Open new window with current buffer
    new_bottom_window = {{'n'}, '<leader>nb', "<cmd>:split<CR>"},
    -- Searches for a word in the buffer
    search_buffer = {{'n', 'i'}, '<C-f>', "<Esc>/"},

    ------------------------------------> KEYBOARD SHORTCUTS FOR TERMINAL <---------------------------------------------------

    -- Opens terminal in floating modes
    open_terminal = {{'n'}, '<leader>t', '<cmd>:ToggleTerm<CR>'},
    -- Opens terminal on the right side
    open_rigth_terminal = {
        {'n'}, '<leader>tr', '<cmd>:botright vnew <BAR> :terminal<CR>'
    },
    -- Opens terminal on the bottom side
    open_bottom_terminal = {
        {'n'}, '<leader>tb', '<cmd>:botright new <BAR> :terminal<CR>'
    },

    ------------------------------------> KEYBOARD SHORTCUTS FOR FILE MANAGER <---------------------------------------------------

    -- Opens file tree
    open_file_manager = {{'n', 'i'}, '<C-b>', '<Esc><cmd>:Neotree toggle<CR>'},
    -- Displays all files in the document
    telescope_files = {{'n'}, '<leader>ff', '<cmd>Telescope fd<CR>'},
    -- Displays all alerts found in the buffer
    telescope_diagnostics = {
        {'n'}, '<leader>fe', '<cmd>Telescope diagnostics<CR>'
    },
    -- Show files and their documents
    telescope_buffers = {{'n'}, '<leader>fb', '<cmd>Telescope buffers<CR>'},
    -- Show help about plugins
    telescope_helps = {{'n'}, '<leader>fh', '<cmd>Telescope help_tags<CR>'},
    -- Show list of available themes
    telescope_themes = {{'n'}, '<leader>hh', '<cmd>Telescope colorscheme<CR>'},
    -- Show list of available commits
    telescope_commits = {{'n'}, '<leader>gc', '<cmd>Telescope git_commits<CR>'},
    -- Show available project statuses
    telescope_status = {{'n'}, '<leader>gs', '<cmd>Telescope git_status<CR>'},
    -- Show list of available git files
    telescope_gitfiles = {{'n'}, '<leader>gf', '<cmd>Telescope git_files<CR>'},
    -- Show list of available branches
    telescope_branches = {
        {'n'}, '<leader>gb', '<cmd>Telescope git_branches<CR>'
    },
    -- Show list of todo comments
    telescope_todos_comments = {{'n'}, '<leader>tc', '<cmd>TodoTelescope<CR>'},

    ------------------------------------> KEYBOARD SHORTCUTS FOR GIT <---------------------------------------------------

    -- Displays inline changes made to the file.
    gitsigns_toggle_line_blame = {
        {'n'}, '<C-g>', '<cmd>:Gitsigns toggle_current_line_blame<CR>'
    },

    ------------------------> KEYBOARD SHORTCUTS FOR EXECUTING AND COMPILING CODE <---------------------------------------------------

    -- Opens the markdown previewer
    markdown_preview = {{'n'}, '<leader>mp', '<cmd>:MarkdownPreviewToggle<CR>'},
    -- Opens the markdown previewer
    open_html = {{'n'}, '<leader>oh', '<cmd>:OpenHTML<CR>'},
    -- Runs a Python script
    run_python = {{'n'}, '<leader>rp', '<cmd>:RunPython<CR>'},
    -- Run a C++ script
    run_cpp = {{'n'}, '<leader>rcpp', '<cmd>:RunCPP<CR>'},
    -- Run a C script
    run_c = {{'n'}, '<leader>rc', '<cmd>:RunC<CR>'},
    -- Runs a JavaScript script
    run_javascript = {{'n'}, '<leader>rjs', '<cmd>:RunJavascript<CR>'},
    -- Run a TypeScript script
    run_typescript = {{'n'}, '<leader>rts', '<cmd>:RunTypescript<CR>'},
    -- Runs a Sass script
    run_scss = {{'n'}, '<leader>rscs', '<cmd>:RunScss<CR>'},
    -- Runs a Go script
    run_go = {{'n'}, '<leader>rgo', '<cmd>:RunGo<CR>'},

    -------------------------> KEYBOARD SHORTCUTS FOR LSP CLIENTS <---------------------------------------------------

    -- Uses neoformat to format the code
    format_code = {{'n', 'i'}, '<S-A-f>', validates_the_code_formatting_type},
    -- Format the documents
    format_code_force = {{'n'}, '<S-A-f>f', vim.lsp.buf.format},
    -- Show code information
    show_information = {{'n', 'i'}, '<C-S-Space>', vim.lsp.buf.hover},
    show_information_secondary = {{'n'}, '<Tab>', vim.lsp.buf.hover},
    -- Go to method definition
    move_definition = {{'n'}, '<C-d>', vim.lsp.buf.definition},
    -- Go to method definition
    move_definition_mouse = {{'n'}, '<C-RightMouse>', vim.lsp.buf.definition},
    -- Go to code action
    code_actions = {{'n'}, '<C-S-o>', vim.lsp.buf.code_action},
    -- Open in a floating window the error diagnostics
    show_diagnostic = {
        {'n'}, '<C-S-M>', function()
            vim.diagnostic.open_float(0, {scope = "line", border = "rounded"})
        end
    },
    show_diagnostic_secondary = {
        {'n'}, '<C-e>', function()
            vim.diagnostic.open_float(0, {scope = "line", border = "rounded"})
        end
    },
    -- LSP signature
    -- show_signature = { { 'i' }, '<C-S-Space>', function() require('lsp_signature').toggle_float_win() end },

    -------------------------> AUTOCOMPLETE SHORTCUTS (CMP) <---------------------------------------------------
    -- Opens the autocomplete menu Linux and MacOS
    autocomplete_open_linux = {{'i'}, '<C-Space>', nil},
    -- Opens the autocomplete menu Windows
    autocomplete_open_windows = {{'i'}, '<C-n>', nil},
    -- Closes the autocomplete
    autocomplete_close = {{'i'}, '<Esc>', nil},
    -- Confirms the selected suggestion
    autocomplete_confirm = {{'i'}, '<Enter>', nil},
    -- Move up in the menu
    autocomplete_up_move = {{'i'}, '<S-Tab>', nil},
    -- Move down in the menu
    autocomplete_down_move = {{'i'}, '<Tab>', nil},
    -- Move up in the documentation
    autocomplete_move_up_docs = {{'i'}, '<C-Up>', nil},
    -- Move down in the documentation
    autocomplete_move_down_docs = {{'i'}, '<C-Down>', nil}
}

--------------------------------> CREATES THE COMMANDS ACCORDING TO THE KEYMAPS TABLE <------------------------------------------------

for key, value in pairs(KEYMAPS) do
    local mode = value[1]
    local keymap = value[2]
    local command = value[3]

    if command ~= nil then
        vim.keymap.set(mode, keymap, command, {noremap = true})
    end
end
