return {
  'mawkler/modicator.nvim',
  dependencies = 'mawkler/onedark.nvim', -- Add your colorscheme plugin here
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    local modicator = require("modicator")
    modicator.setup({
      -- Show warning if any required option is missing
      show_warnings = true,
      highlights = {
        -- Default options for bold/italic. You can override these individually
        -- for each mode if you'd like as seen below.
        defaults = {
          foreground = modicator.get_highlight_fg('CursorLineNr'),
          background = modicator.get_highlight_bg('CursorLineNr'),
          bold = true,
          italic = true
        },
        -- Color and bold/italic options for each mode. You can add a bold and/or
        -- italic key pair to override the default highlight for a specific mode if
        -- you would like.
        modes = {
          ['n']   = {
            foreground = "#BB8FCE",
          },
          ['i']   = {
            foreground = "#85C1E9",
          },
          ['v']   = {
            foreground = "#F7DC6F",
          },
          ['V']   = {
            foreground = modicator.get_highlight_fg('Type'),
          },
          ['�'] = { -- This symbol is the ^V character
            foreground = modicator.get_highlight_fg('Type'),
          },
          ['s']   = {
            foreground = modicator.get_highlight_fg('Keyword'),
          },
          ['S']   = {
            foreground = modicator.get_highlight_fg('Keyword'),
          },
          ['R']   = {
            foreground = modicator.get_highlight_fg('Title'),
          },
          ['c']   = {
            foreground = modicator.get_highlight_fg('Constant'),
          },
        },
      },
    })
  end,
}
