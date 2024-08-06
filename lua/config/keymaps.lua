vim.g.mapleader = ',' -- Defines the leader key of neovim
local M = {}
local opts = { noremap = true, silent = true }

-------------- keymaps form basic commands ----------------
vim.keymap.set({ 'i', 'n' }, "<Esc>", "<Esc><cmd>:VMClear <BAR> :nohl <CR>", opts)          -- Clears whatever the Visial-vim plugin does.
vim.keymap.set('n', 'q', "<cmd>:q<CR>", opts)                                               -- Close the buffer
vim.keymap.set('n', '<leader>qq', "<cmd>:q!<CR>", opts)                                     -- Force the buffer to close
vim.keymap.set('v', '<C-c>', 'y', opts)                                                     -- Copy to document
vim.keymap.set('v', '<C-v>', '<Esc>pi', opts)                                               -- Paste into document
vim.keymap.set('v', '<C-x>', 'd', opts)                                                     -- Cut text
vim.keymap.set('n', '<C-a>', '<Esc>gg0vG$', opts)                                           -- Select all text in document
vim.keymap.set('n', '<S-Down>', 'yyp', opts)                                                -- Copy the line at the bottom of the document
vim.keymap.set('n', '<A-Down>', '<cmd>:m+1<CR>', opts)                                      -- Moves the line to the bottom of the following line
vim.keymap.set('n', '<A-Up>', '<cmd>:m-2<CR>', opts)                                        -- Move line to top of next line
vim.keymap.set({ 'n', 'i' }, '<C-z>', '<cmd>:undo<CR>', opts)                               -- Undo the changes
vim.keymap.set('n', '<C-y>', '<cmd>:redo<CR>', opts)                                        -- Rebuild changes
vim.keymap.set('n', '<C-p>', '<cmd>:CommentToggle<CR>', opts)                               -- Comment out the line where you are located
vim.keymap.set('n', '<C-p>', '<cmd>:CommentToggle<CR>', opts)                               -- Comment all selected lines (Visual)
vim.keymap.set({ 'n', 'i' }, '<C-s>', "<cmd>:w<CR>", opts)                                  -- Save the buffer
vim.keymap.set({ 'n', 'i' }, '<Space>wp', "<cmd>bprevious<CR>", opts)                       -- Move to previous buffer (left)
vim.keymap.set({ 'n', 'i' }, '<Space>wn', "<cmd>bnext<CR>", opts)                           -- Move to the next buffer (right)
vim.keymap.set({ 'n', 'i' }, '<C-f>', "<Esc>/", opts)                                       -- Searches for a word in the buffer
vim.keymap.set({ 'n', 'i' }, '<C-h>', [[<cmd>lua require("tmux").move_left()<cr>]], opts)   -- Move cursor to the left window
vim.keymap.set({ 'n', 'i' }, '<C-j>', [[<cmd>lua require("tmux").move_bottom()<cr>]], opts) -- Move cursor to the down window
vim.keymap.set({ 'n', 'i' }, '<C-k>', [[<cmd>lua require("tmux").move_top()<cr>]], opts)    -- Move cursor to the up window
vim.keymap.set({ 'n', 'i' }, '<C-l>', [[<cmd>lua require("tmux").move_right()<cr>]], opts)  -- Move cursor to the right window
vim.keymap.set({ 'n' }, '<Space>wc', "<cmd>:bdelete<CR>", opts)                             -- Close the tab or buffer you are in.
vim.keymap.set({ 'n' }, '<Space>wv', "<cmd>:vsplit<CR>", opts)                              -- Open new window with current buffer
vim.keymap.set({ 'n' }, '<Space>wh', "<cmd>:split<CR>", opts)                               -- Open new window with current buffer

-------------- Keymaps form terminal commands ----------------
vim.api.nvim_set_keymap('t', '<C-n>', [[<C-\><C-n>]], opts)                            -- Opens terminal in floating modes
vim.keymap.set({ 'n' }, '<leader>tc', '<cmd>:ToggleTerm<CR>', opts)                    -- Opens terminal in floating modes
vim.keymap.set({ 'n' }, '<leader>tv', '<cmd>:botright vnew <BAR> :terminal<CR>', opts) -- Opens terminal on the right side
vim.keymap.set({ 'n' }, '<leader>th', '<cmd>:botright new <BAR> :terminal<CR>', opts)  -- Opens terminal on the bottom side

-------------- Keymaps form utils commands ----------------
-- vim.keymap.set('n', '<Space>z', '<cmd>ZenModeToggle<CR>', opts) --- Enables the Zen Mode

-------------- Keymaps form files and buffers telescope commands ----------------
vim.keymap.set({ 'n', 'i' }, '<C-b>', "<Esc><cmd>Neotree toggle<CR>", opts)                                              -- Opens file tree
vim.keymap.set({ 'n' }, '<Space>te', '<cmd>Telescope diagnostics<CR>', opts)                                             -- Displays all alerts found in the buffer
vim.keymap.set({ 'n' }, '<Space>tb', '<cmd>Telescope buffers<CR>', opts)                                                 -- Show files and their documents
vim.keymap.set({ 'n' }, '<Space>th', '<cmd>Telescope help_tags<CR>', opts)                                               -- Show help about plugins
vim.keymap.set({ 'n' }, '<Space>thh', '<cmd>Telescope colorscheme<CR>', opts)                                            -- Show list of available themes
vim.keymap.set({ 'n' }, '<Space>tgc', '<cmd>Telescope git_commits<CR>', opts)                                            -- Show list of available commits
vim.keymap.set({ 'n' }, '<Space>tgs', '<cmd>Telescope git_status<CR>', opts)                                             -- Show available project statuses
vim.keymap.set({ 'n' }, '<Space>tgf', '<cmd>Telescope git_files<CR>', opts)                                              -- Show list of available git files
vim.keymap.set({ 'n' }, '<Space>tgb', '<cmd>Telescope git_branches<CR>', opts)                                           -- Show list of available branches
vim.keymap.set({ 'n' }, '<Space>tc', '<cmd>TodoTelescope<CR>', opts)                                                     -- Show list of todo comments
vim.keymap.set("n", "<Space>tt", '<cmd>TodoTelescope<CR>', opts)                                                         -- Show list of todo comments
vim.keymap.set('n', '<Space>ff', '<cmd>Telescope find_files<CR>', opts)                                                  -- Displays all files in the document
vim.keymap.set("n", ';;', [[<cmd>lua require("telescope.builtin").resume()<CR>]], opts)                                  -- Recuperate last search
vim.keymap.set('n', '<Space>fd', [[<cmd>lua require("telescope.builtin").diagnostics()<CR>]], opts)                      -- Displays all files in the document
vim.keymap.set("n", "<Space>fg", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], opts) -- Displays all files in the document

-------------- Keymaps form Explorer commands ----------------
vim.keymap.set("n", "-", "<CMD>Oil<CR>", opts)                                                            -- Open parent directory
M.oil_show_help = { { 'n' }, '<Space>eh', ':Oil actions.show_help<CR>', opts }                            -- Show help
M.oil_select = { { 'n' }, '<CR>', ':Oil actions.select<CR>', opts }                                       -- Select entry
M.oil_select_vertical = { { 'n' }, '<Space>ev', ':Oil actions.select { vertical = true }<CR>', opts }     -- Open in vertical split
M.oil_select_horizontal = { { 'n' }, '<Space>es', ':Oil actions.select { horizontal = true }<CR>', opts } -- Open in horizontal split
M.oil_select_tab = { { 'n' }, '<Space>et', ':Oil actions.select { tab = true }<CR>', opts }               -- Open in new tab
M.oil_preview = { { 'n' }, '<Space>ep', ':Oil actions.preview<CR>', opts }                                -- Preview entry
M.oil_close = { { 'n' }, '<Space>ec', ':Oil actions.close<CR>', opts }                                    -- Close oil.nvim
M.oil_refresh = { { 'n' }, '<Space>el', ':Oil actions.refresh<CR>', opts }                                -- Refresh oil.nvim
M.oil_parent = { { 'n' }, '<Space>e-', ':Oil actions.parent<CR>', opts }                                  -- Go to parent directory
M.oil_open_cwd = { { 'n' }, '<Space>eo', ':Oil actions.open_cwd<CR>', opts }                              -- Open current working directory
M.oil_cd = { { 'n' }, '<Space>e`', ':Oil actions.cd<CR>', opts }                                          -- Change directory
M.oil_cd_tab = { { 'n' }, '<Space>e~', ':Oil actions.cd { scope = "tab" }<CR>', opts }                    -- Change directory for tab
M.oil_change_sort = { { 'n' }, '<Space>es', ':Oil actions.change_sort<CR>', opts }                        -- Change sort
M.oil_open_external = { { 'n' }, '<Space>ex', ':Oil actions.open_external<CR>', opts }                    -- Open externally
M.oil_toggle_hidden = { { 'n' }, '<Space>e.', ':Oil actions.toggle_hidden<CR>', opts }                    -- Toggle hidden files
M.oil_toggle_trash = { { 'n' }, '<Space>e\\', ':Oil actions.toggle_trash<CR>', opts }                     -- Toggle trash

-------------- Keymaps form git commands ----------------
vim.keymap.set({ 'n' }, '<Space>ggg', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts) -- Displays inline changes made to the file.

-------------- Keymaps form preview code commands ----------------
vim.keymap.set({ 'n' }, '<leader>pm', '<cmd>:MarkdownPreviewToggle<CR>', opts) -- Opens the markdown previewer
vim.keymap.set({ 'n' }, '<leader>ph', '<cmd>:OpenHTML<CR>', opts)              -- Opens the markdown previewer
vim.keymap.set({ 'n' }, '<leader>pp', '<cmd>:RunPython<CR>', opts)             -- Runs a Python script
vim.keymap.set({ 'n' }, '<leader>pcpp', '<cmd>:RunCPP<CR>', opts)              -- Run a C++ script
vim.keymap.set({ 'n' }, '<leader>pc', '<cmd>:RunC<CR>', opts)                  -- Run a C script
vim.keymap.set({ 'n' }, '<leader>pjs', '<cmd>:RunJavascript<CR>', opts)        -- Runs a JavaScript script
vim.keymap.set({ 'n' }, '<leader>pts', '<cmd>:RunTypescript<CR>', opts)        -- Run a TypeScript script
vim.keymap.set({ 'n' }, '<leader>pscs', '<cmd>:RunScss<CR>', opts)             -- Runs a Sass script
vim.keymap.set({ 'n' }, '<leader>pgo', '<cmd>:RunGo<CR>', opts)                -- Runs a Go script

-------------- Keymaps form LSP commands ----------------
vim.keymap.set('n', '<leader>f', validates_the_code_formatting_type, opts)                     -- Format the documents
vim.keymap.set('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>', opts)                   -- Force Format the documents
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                    -- Show code information
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                -- Show code information
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)              -- Go to method definition
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)             -- Go to method declaration
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)          -- Go to method implementation
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)              -- Go to method references
vim.keymap.set({ 'n', 'i' }, '<C-RightMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to method definition
vim.keymap.set({ 'n' }, 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)                  -- Open in a floating window the error diagnostics
vim.keymap.set({ 'n' }, '<C-d>',
    function() vim.diagnostic.open_float(0, { scope = "line", border = "rounded" }) end, opts) -- Show code information

-------------- Keymaps form CMP commands ----------------
M.cmp_autocomplete_open_linux = { { 'i' }, '<C-Space>', nil }    -- Opens the autocomplete menu Linux and MacOS
M.cmp_autocomplete_open_windows = { { 'i' }, '<C-n>', nil }      -- Opens the autocomplete menu Windows
M.cmp_autocomplete_open_macos = { { 'i' }, '<C-Space>', nil }    -- Opens the autocomplete menu Linux and MacOS
M.cmp_autocomplete_close = { { 'i' }, '<Esc>', nil }             -- Closes the autocomplete
M.cmp_autocomplete_confirm = { { 'i' }, '<Enter>', nil }         -- Confirms the selected suggestion
M.cmp_autocomplete_up_move = { { 'i' }, '<S-Tab>', nil }         -- Move up in the menu
M.cmp_autocomplete_down_move = { { 'i' }, '<Tab>', nil }         -- Move up in the documentation
M.cmp_autocomplete_move_up_docs = { { 'i' }, '<C-Up>', nil }     -- Move up in the documentation
M.cmp_autocomplete_move_down_docs = { { 'i' }, '<C-Down>', nil } -- Move down in the documentation

-------------- Keymaps form Machine Learnings Assistant commands ----------------
M.assistant_accept_suggestion = { { 'i' }, '<Tab>', nil } -- Accept the selected suggestion
M.assistant_clear_suggestion = { { 'i' }, '<C-]>', nil }  -- Clear the suggestion
M.assistant_accept_word = { { 'i' }, '<C-j>', nil }       -- Accept the word

_G.KEYMAPS = M
return M
