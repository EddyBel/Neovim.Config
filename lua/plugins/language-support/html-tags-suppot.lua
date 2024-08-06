return {
    {
        'alvan/vim-closetag',
        ft = { "html", "javascriptreact", "typescriptreact" }
    },
    { 'mattn/emmet-vim', ft = "html" },
    {
        'jwalton512/vim-blade',
        ft = "blade",
        init = function()
            vim.cmd [[ autocmd BufNewFile,BufRead *.blade.php set filetype=blade ]]
        end
    },
    {
        'barrett-ruth/live-server.nvim',
        build = 'npm install -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        enabled = function() return UTILS.command_exists("npm") end,
        config = true
    }
}
