return {
  'romgrk/barbar.nvim',
  config = function()
    vim.g.barbar_auto_setup = false -- disable auto-setup
    require 'barbar'.setup {
      animation = true,
      auto_hide = false,
      tabpages = false,
      clickable = true,
      focus_on_close = 'left',
      hide = { extensions = false, inactive = false },
      highlight_alternate = false,
      highlight_inactive_file_icons = true,
      highlight_visible = false,

      icons = {
        buffer_index = true,
        buffer_number = false,
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = false, icon = ICONS.error .. " " },
          [vim.diagnostic.severity.WARN] = { enabled = false, icon = ICONS.warn .. " " },
          [vim.diagnostic.severity.INFO] = { enabled = false, icon = ICONS.info .. " " },
          [vim.diagnostic.severity.HINT] = { enabled = false, icon = ICONS.hint .. " " },
        },
        gitsigns = {
          added = { enabled = false, icon = '+' },
          changed = { enabled = false, icon = '~' },
          deleted = { enabled = false, icon = '-' },
        },
        filetype = {
          custom_colors = false,
          enabled = true,
        },
        separator = { left = '▎', right = ' ' },
        modified = { button = '●' },
        pinned = { button = '', filename = true },
        preset = 'default',
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = false },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },

      insert_at_end = false,
      insert_at_start = true,
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 40,
      minimum_length = 0,
      semantic_letters = true,

      sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = 'undotree' },
        ['neo-tree'] = { event = 'BufWipeout' },
        Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
      },
    }
  end

}
