export const plugins = [
  {
    plugin: 'LuaSnip',
    description: 'Provides snippet expansion capabilities in Neovim.',
  },
  {
    plugin: 'alpha-nvim',
    description: 'Enhances the look and feel of Neovim.',
  },
  {
    plugin: 'barbar.nvim',
    description: 'Provides an enhanced tab bar for the Neovim interface.',
  },
  {
    plugin: 'cmp-buffer',
    description: 'Add-on for auto-completion and text expansion in Neovim.',
  },
  {
    plugin: 'cmp-cmdline',
    description: 'Extends the autocomplete functionality for command line mode in Neovim.',
  },
  {
    plugin: 'cmp-git',
    description: 'Provides auto-completion functions specific to Git version control in Neovim.',
  },
  {
    plugin: 'cmp-nvim-lsp',
    description: 'Integrates LSP (Language Server Protocol) auto-completion for Neovim.',
  },
  {
    plugin: 'cmp-nvim-lsp-signature-help',
    description: 'Displays function signature information while writing in Neovim.',
  },
  {
    plugin: 'cmp-nvim-lua',
    description: 'Provides Lua-specific auto-completion functions in Neovim.',
  },
  {
    plugin: 'cmp-path',
    description: 'Enhances auto-completion of file and directory paths in Neovim.',
  },
  {
    plugin: 'cmp-snippy',
    description: 'Integrates the Snippy add-on with auto-completion in Neovim.',
  },
  {
    plugin: 'cmp-vsnip',
    description: 'Enables autocompletion using the vsnip plugin in Neovim.',
  },
  {
    plugin: 'cmp_luasnip',
    description: 'Integrates the LuaSnip add-on with autocompletion in Neovim.',
  },
  {
    plugin: 'diffview.nvim',
    description: 'Provides an interface to view diffs between files in Neovim.',
  },
  {
    plugin: 'editorconfig-vim',
    description: 'Supports code style configuration using .editorconfig files in Neovim.',
  },
  {
    plugin: 'focus.nvim',
    description: 'Helps to keep the focus on the current window in Neovim.',
  },
  {
    plugin: 'gitsigns.nvim',
    description: 'Provides visual information and commands related to Git version control in Neovim.',
  },
  {
    plugin: 'indent-blankline.nvim',
    description: 'Visually highlights indents in Neovim.',
  },
  {
    plugin: 'lazy.nvim',
    description: 'Deferred loads plugins in Neovim to improve startup time.',
  },
  {
    plugin: 'lspkind-nvim',
    description: 'Improves the appearance of icons displayed by LSP in Neovim.',
  },
  {
    plugin: 'lualine.nvim',
    description: 'Creates a custom status line in Neovim.',
  },
  {
    plugin: 'mason-lspconfig.nvim',
    description: 'Configures LSP settings for the Mason plug-in in Neovim.',
  },
  {
    plugin: 'mason.nvim',
    description: 'Integration of Neovim with the Mason plug-in.',
  },
  {
    plugin: 'modicator.nvim',
    description: 'Provides custom keyboard modifiers in Neovim.',
  },
  {
    plugin: 'neo-tree.nvim',
    description: 'Creates a tree structure of files and directories in Neovim.',
  },
  {
    plugin: 'Neoformat',
    description: 'Provides automatic formatting for different file types in Neovim.',
  },
  {
    plugin: 'nui.nvim',
    description: 'Lua library for creating user interfaces in Neovim.',
  },
  {
    plugin: 'nvim-autopairs',
    description: 'Helps to auto-complete character pairs in Neovim.',
  },
  {
    plugin: 'nvim-cmp',
    description: 'Auto-completion and text expansion engine for Neovim.',
  },
  {
    plugin: 'nvim-colorizer.lua',
    description: 'Automatically colors hex and color codes in Neovim.',
  },
  {
    plugin: 'nvim-comment',
    description: 'Provides keyboard shortcuts to quickly comment and uncomment code blocks in Neovim.',
  },
  {
    plugin: 'nvim-lspconfig',
    description: 'Predefined settings for Language Server Protocol (LSP) support in Neovim.',
  },
  {
    plugin: 'nvim-notify',
    description: 'Creates customizable popup notifications in Neovim.',
  },
  {
    plugin: 'nvim-snippy',
    description: 'Integration of Snippy add-on with autocomplete in Neovim.',
  },
  {
    plugin: 'vvim-treesitter',
    description: 'Provides real-time parsing to improve editing and navigation in Neovim.',
  },
  {
    plugin: 'nvim-ts-rainbow',
    description: 'Highlights matching parentheses and brackets using colors in Neovim.',
  },
  {
    plugin: 'nvim-web-devicons',
    description: 'Displays custom icons for files and directories in Neovim.',
  },
  {
    plugin: 'nvim-window-picker',
    description: 'Allows interactive window selection in Neovim.',
  },
  {
    plugin: 'plenary.nvim',
    description: 'Library of utility functions for add-on development in Neovim.',
  },
  {
    plugin: 'telescope.nvim',
    description: 'Provides a search and browse interface for Neovim.',
  },
  {
    plugin: 'todo-comments.nvim',
    description: 'Highlights and manages comments related to tasks and notes in Neovim.',
  },
  {
    plugin: 'toggleterm.nvim',
    description: 'Creates pop-up terminals in Neovim that can be easily shown and hidden.',
  },
  {
    plugin: 'tokyonight.nvim',
    description: 'A color scheme for Neovim based on the Tokyo Night theme.',
  },
  {
    plugin: 'transparent.nvim',
    description: 'Allows you to set the transparency of windows in Neovim.',
  },
  {
    plugin: 'vim-bbye',
    description: 'Provides commands to quickly close windows and buffers in Neovim.',
  },
  {
    plugin: 'vim-snippets',
    description: 'Set of code snippets for use with the nvim-cmp plugin in Neovim.',
  },
  {
    plugin: 'vim-tmux-navigator',
    description: 'Allows seamless navigation between Neovim and Tmux.',
  },
  {
    plugin: 'vim-visual-multi',
    description: 'Extends the multiple selection functionality in Neovim for fast and efficient editing.',
  },
  {
    plugin: 'vim-vsnip',
    description: 'Code snippet plugin for use with the nvim-cmp plugin in Neovim.',
  },
  {
    plugin: 'color-picker.nvim',
    description: 'Color picker tool for Neovim.',
  },
  {
    plugin: 'csv.vim',
    description: 'CSV file support in Neovim.',
  },
  {
    plugin: 'emmet-vim',
    description: 'Quick HTML and CSS code expansion in Neovim.',
  },
  {
    plugin: 'gruvbox.nvim',
    description: 'Popular color scheme for Neovim.',
  },
  {
    plugin: 'kanagawa.nvim',
    description: 'Japanese inspired color scheme for Neovim.',
  },
  {
    plugin: 'markdown-preview.nvim',
    description: 'Generates real-time Markdown file previews in Neovim.',
  },
  {
    plugin: 'neovim',
    description: 'Color scheme for neovim.',
  },
  {
    plugin: 'nightfox.nvim',
    description: 'Dark color scheme for Neovim.',
  },
  {
    plugin: 'nvim',
    description: 'Color scheme for neovim.',
  },
  {
    plugin: 'onedark.nvim',
    description: 'Color scheme inspired by One Dark theme for Neovim.',
  },
  {
    plugin: 'oxocarbon.nvim',
    description: 'Color scheme inspired by the Carbon theme for Neovim.',
  },
  {
    plugin: 'vim',
    description: 'Color scheme for Neovim.',
  },
  {
    plugin: 'vim-blade',
    description: 'Template language support.',
  },
];
