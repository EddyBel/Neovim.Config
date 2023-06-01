-- REQUIRED INITIAL SETTINGS
vim.g.mapleader = " "      -- Defines the leader key of neovim
vim.o.termguicolors = true -- Enables the use of colors in the terminal
-- VARIABLES AND INITIAL FUNCTIONS
require("globals")
require("config.env")
require("utils.utilities")
require("utils.global_utilities")
-- PERSONAL LIBRARIES
require("lib.create_files")
require("lib.execute_codes")
-- PLUGIN LOADING
require("config.lazy")
require("lazy").setup("plugins")
-- FINAL SETUPS AND KEYBOARD MAPPINGS
require("config.settings")
require("config.map")
