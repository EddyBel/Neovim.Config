return {
    { 'moll/vim-bbye',                 event = 'VeryLazy' },
    { 'editorconfig/editorconfig-vim', event = 'VeryLazy' },

    {
        "sindrets/diffview.nvim",
        cond = function() return vim.fn.isdirectory(".git") == 1 end
    },
    { 'chrisbra/csv.vim', ft = "csv" },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        config = function() vim.fn["mkdp#util#install"]() end
    },
}
