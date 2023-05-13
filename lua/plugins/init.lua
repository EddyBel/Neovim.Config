return {
  "jwalton512/vim-blade",
  'mattn/emmet-vim',
  'alvan/vim-closetag',
  'christoomey/vim-tmux-navigator',
  'p00f/nvim-ts-rainbow',
  'moll/vim-bbye',
  'romgrk/barbar.nvim',
  "sindrets/diffview.nvim",
  'editorconfig/editorconfig-vim',
  {
    "iamcco/markdown-preview.nvim",
    config = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = true,
  },
  {
    "ziontee113/color-picker.nvim",
    keys = { { "<C-c>", "<cmd>PickColorInsert<cr>", mode = "i", desc = "ColorPicker" } },
    config = true,
  },
  {
    'akinsho/toggleterm.nvim',
    config = true,
    opts = {
      direction = "float"
    }
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  config = function()
    -- NERDTree
    vim.g.NERDTreeMinimalUI = 1
    -- emmet_vim
    vim.g.user_emmet_leader_key = '<Nop>'
    -- vim-closetag
    vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml'
    vim.g.closetag_xhtml_filenames = '*.xhtml,*.jsx'
    vim.g.closetag_filetypes = 'html,xhtml,phtml'
    vim.g.closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

    vim.g.closetag_emptyTags_caseSensitive = 1

    vim.g.closetag_regions = {
      ['typescript.tsx'] = 'jsxRegion,tsxRegion',
      ['javascript.jsx'] = 'jsxRegion',
      ['typescriptreact'] = 'jsxRegion,tsxRegion',
      ['javascriptreact'] = 'jsxRegion',
    }
    vim.g.closetag_shortcut = '>'
    vim.g.closetag_close_shortcut = '<leader>>'
    vim.g.closetag_enable_react_fragment = 1
  end
}
