--------------------------------------> KEYBOARD SHORTCUTS RESET <---------------------------------------------------

vim.keymap.set({ 'i', 'n' }, '<Esc>', '<Esc><cmd>:VMClear <BAR> :nohl <CR>', { noremap = true }) -- Clears whatever the Visial-vim plugin does.

------------------------------> KEYBOARD SHORTCUTS FOR FILES AND BUFFERS <-----------------------------------------------

vim.keymap.set('n', 'q', '<cmd>:q<CR>', { noremap = true })                  -- Close the buffer
vim.keymap.set('n', '<leader>qq', '<cmd>:q!<CR>', { noremap = true })        -- Force the buffer to close
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>:w<CR>', { noremap = true })     -- Save the buffer
vim.keymap.set('n', '<C-h><C-h>', '<cmd>:bprevious<CR>', { noremap = true }) -- Move to previous buffer (left)
vim.keymap.set('n', '<C-l><C-l>', '<cmd>:bnext<CR>', { noremap = true })     -- Move to the next buffer (right)
vim.keymap.set('n', '<C-q><C-q>', '<cmd>:Bdelete<CR>', { noremap = true })   -- Close the tab or buffer you are in.
vim.keymap.set('n', '<leader>nr', '<cmd>:vsplit<CR>', { noremap = true })    -- Open new window with current buffer
vim.keymap.set('n', '<leader>nb', '<cmd>:split<CR>', { noremap = true })     -- Open new window with current buffer
vim.keymap.set({ 'n', 'i' }, '<C-f>', '<Esc>/', { noremap = true })          -- Searches for a word in the buffer

------------------------------> KEYBOARD SHORTCUTS FOR TEXT MANIPULATION <-----------------------------------------------

vim.keymap.set('v', '<C-c>', 'y', { noremap = true })                                -- Copy to document
vim.keymap.set('i', '<C-v>', '<Esc>pi', { noremap = true })                          -- Paste into document
vim.keymap.set('v', '<C-x>', 'd', { noremap = true })                                -- Cut text
vim.keymap.set({ 'n', 'v' }, '<C-a>', '<Esc>gg0vG$', { noremap = true })             -- Select all text in document
vim.keymap.set('n', '<A-Down>', 'yyp', { noremap = true })                           -- Copy the line at the bottom of the document
vim.keymap.set('n', '<S-Down>', '<cmd>:m+1<CR>', { noremap = true })                 -- Moves the line to the bottom of the following line
vim.keymap.set('n', '<S-Up>', '<cmd>:m-2<CR>', { noremap = true })                   -- Move line to top of next line
vim.keymap.set({ 'n', 'i' }, '<C-z>', '<cmd>:undo<CR>', { noremap = true })          -- Undo the changes
vim.keymap.set({ 'n', 'i' }, '<C-y>', '<cmd>:redo<CR>', { noremap = true })          -- Rebuild changes
vim.keymap.set({ 'n', 'i' }, '<C-p>', '<cmd>:CommentToggle<CR>', { noremap = true }) -- Comment out the line where you are located
vim.keymap.set('v', '<C-p>', '<S-:>CommentToggle<CR>', { noremap = true })           -- Comment all selected lines (Visual)

------------------------------------> KEYBOARD SHORTCUTS FOR TERMINAL <---------------------------------------------------

vim.keymap.set('n', '<leader>tr', '<cmd>:botright vnew <BAR> :terminal<CR>', { noremap = true }) -- Opens terminal on the right side
vim.keymap.set('n', '<leader>tb', '<cmd>:botright new <BAR> :terminal<CR>', { noremap = true })  -- Opens terminal on the bottom side
vim.keymap.set('n', '<leader>t', '<cmd>:ToggleTerm<CR>', { noremap = true })                     -- Opens terminal in floating mode

------------------------------------> KEYBOARD SHORTCUTS FOR FILE MANAGER <---------------------------------------------------

vim.keymap.set({ 'n', 'i' }, '<C-b>', '<Esc><cmd>:NeoTreeFocusToggle<CR>', { noremap = true }) -- Opens file tree
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope fd<CR>', { noremap = true })                 -- Displays all files in the document
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope diagnostics<CR>', { noremap = true })        -- Displays all alerts found in the buffer
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })            -- Show files and their documents
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })          -- Show help about plugins
vim.keymap.set('n', '<leader>hh', '<cmd>Telescope colorscheme<CR>', { noremap = true })        -- Show list of available themes
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { noremap = true })        -- Show list of available commits
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { noremap = true })         -- Show available project statuses
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { noremap = true })          -- Show list of available git files
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { noremap = true })       -- Show list of available branches
vim.keymap.set('n', '<leader>tc', '<cmd>TodoTelescope<CR>', { noremap = true })                -- Show list of todo comments


------------------------------------> KEYBOARD SHORTCUTS FOR GIT <---------------------------------------------------

vim.keymap.set('n', '<C-g>', '<cmd>:Gitsigns toggle_current_line_blame<CR>', { noremap = true }) -- Displays inline changes made to the file.

-------------------------> KEYBOARD SHORTCUTS FOR EXECUTING AND COMPILING CODE <---------------------------------------------------

vim.keymap.set('n', '<leader>mp', '<cmd>:MarkdownPreviewToggle<CR>', { noremap = true }) -- Opens the markdown previewer
vim.keymap.set('n', '<leader>oh', '<cmd>:OpenHTML<CR>', { noremap = true })              -- Opens the markdown previewer
vim.keymap.set('n', '<leader>rp', '<cmd>:RunPython<CR>', { noremap = true })             -- Runs a Python script
vim.keymap.set('n', '<leader>rcpp', '<cmd>:RunCPP<CR>', { noremap = true })              -- Run a C++ script
vim.keymap.set('n', '<leader>rc', '<cmd>:RunC<CR>', { noremap = true })                  -- Run a C script
vim.keymap.set('n', '<leader>rjs', '<cmd>:RunJavaScript<CR>', { noremap = true })        -- Runs a JavaScript script
vim.keymap.set('n', '<leader>rts', '<cmd>:RunTypeScript<CR>', { noremap = true })        -- Run a TypeScript script
vim.keymap.set('n', '<leader>rscs', '<cmd>:RunScss<CR>', { noremap = true })             -- Runs a Sass script
vim.keymap.set('n', '<leader>rgo', '<cmd>:RunGo<CR>', { noremap = true })                -- Runs a Go script

-------------------------> KEYBOARD SHORTCUTS FOR LSP CLIENTS <---------------------------------------------------

vim.keymap.set('n', '<S-A-f>', validates_the_code_formatting_type, { noremap = true }) -- Uses neoformat to format the code
vim.keymap.set('n', '<S-A-f>f', vim.lsp.buf.format, { noremap = true })                -- Format the documents
vim.keymap.set('n', '<Tab>', vim.lsp.buf.hover, { noremap = true })                    -- Show code information
vim.keymap.set('n', '<C-d>', vim.lsp.buf.definition, { noremap = true })               -- Go to method definition
vim.keymap.set('n', '<C-RightMouse>', vim.lsp.buf.definition, { noremap = true })      -- Go to method definition
vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, { noremap = true })              -- Go to code action
vim.keymap.set('n', '<C-e>', function()
    vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })
end, { noremap = true }) -- open in a floating window the error diagnostics
