-- REQUIRED INITIAL SETTINGS
-- vim.g.mapleader = " "      -- Defines the leader key of neovim
vim.o.termguicolors = true -- Enables the use of colors in the terminal
-- VARIABLES AND INITIAL FUNCTIONS
require("globals")
require("config.env")
require("utils.utilities")
require("utils.global_utilities")
require("utils.information_utilities")
require("utils.notifications")
-- SETUPS AND KEYBOARD MAPPINGS
require("config.keymaps")
require("config.settings")
require("config.commands")
-- PERSONAL LIBRARIES
require("lib.create_files")
require("lib.execute_codes")
require("lib.clean-optimizate")
-- PLUGIN LOADING
require("config.lazy")
-- require("lazy").setup("plugins")
require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.auto-complete" },
        { import = "plugins.editor" },
        { import = "plugins.language-support" },
        { import = "plugins.ui" },
    }
})
require("scripts.autocmds")
