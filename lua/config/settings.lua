--------------------------------> NATIVE NEOVIM CONFIGURATIONS <--------------------------------------
vim.opt.number = true -- Enable line numbers
vim.opt.mouse = "a" -- Enable mouse use in all modes
vim.opt.showcmd = true -- Displays partial commands on last line
vim.opt.encoding = "utf-8" -- Sets character encoding to UTF-8
vim.opt.showmatch = true -- Highlight the parenthesis that corresponds to the one under the cursor
vim.opt.autoindent = true -- Automatically indent new lines according to the previous one
vim.opt.splitbelow = true -- Opens the horizontal windows below the current window
vim.opt.splitright = true -- Opens the vertical windows to the right of the current window
vim.opt.laststatus = 2 -- Displays the status bar in all windows
vim.opt.showmode = false -- Hides the current mode on the last line
vim.opt.clipboard:append{'unnamed', 'unnamedplus'} -- Set whatever is copied to go to the clipboard
vim.opt.fillchars = {eob = ' '} -- Clears the ~ symbols from the editor
vim.o.termguicolors = true -- Setting that enhances colors and layouts
vim.opt.wrap = true -- Do not wrap to monitor size
vim.opt.history = 1000 -- Set the size of the history that will be displayed
vim.opt.relativenumber = true -- Enable line numbers relative to the cursor
vim.o.cursorline = true
-- vim.opt.opt.t_ut = ''                              -- In case of background failures

-------------------------------> TAB AND SPACE SETTINGS <----------------------------------------------

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

------------------------------> CONFIGURES BASIC AUTOMATIC FUNCTIONS <---------------------------------

vim.cmd([[ autocmd BufWritePre * lua validates_the_code_formatting_type() ]]) -- Execute a function that formats the code each time the buffer is saved.
vim.cmd([[ autocmd BufWritePre * :%s/\s\+$//e ]]) -- Removes residual spaces or tabs at the end of each line.
