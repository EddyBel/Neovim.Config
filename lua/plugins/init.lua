return {
  -- 'preservim/nerdtree',
  "jwalton512/vim-blade",
  'mattn/emmet-vim',
  'alvan/vim-closetag',
  'christoomey/vim-tmux-navigator',
  'p00f/nvim-ts-rainbow',
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
