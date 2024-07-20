return {
    {
        "beauwilliams/focus.nvim",
        event = 'VeryLazy',
        config = function()

            local ignore_filetypes = {'neo-tree'}
            local ignore_buftypes = {'nofile', 'prompt', 'popup'}

            local augroup = vim.api.nvim_create_augroup('FocusDisable',
                                                        {clear = true})

            vim.api.nvim_create_autocmd('WinEnter', {
                group = augroup,
                callback = function(_)
                    if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
                        vim.w.focus_disable = true
                    else
                        vim.w.focus_disable = false
                    end
                end,
                desc = 'Disable focus autoresize for BufType'
            })

            vim.api.nvim_create_autocmd('FileType', {
                group = augroup,
                callback = function(_)
                    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                        vim.b.focus_disable = true
                    else
                        vim.b.focus_disable = false
                    end
                end,
                desc = 'Disable focus autoresize for FileType'
            })

            require("focus").setup()
        end
    },
    {'moll/vim-bbye', event = 'VeryLazy'},
    {'editorconfig/editorconfig-vim', event = 'VeryLazy'},
    {
        'xiyaowong/transparent.nvim',
        config = function()
            if BACKGROUND_TRANSPARENT then
                vim.cmd("TransparentEnable")
            else
                vim.cmd("TransparentDisable")
            end
        end
    },
    {'alvan/vim-closetag', ft = {"html", "javascriptreact", "typescriptreact"}},
    {'mattn/emmet-vim', ft = "html"},
    {
        'jwalton512/vim-blade',
        ft = "blade",
        init = function()
            vim.cmd [[ autocmd BufNewFile,BufRead *.blade.php set filetype=blade ]]
        end
    },
    {
        "sindrets/diffview.nvim",
        cond = function() return vim.fn.isdirectory(".git") == 1 end
    },
    {'chrisbra/csv.vim', ft = "csv"},
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        config = function() vim.fn["mkdp#util#install"]() end
    },
    {"norcalli/nvim-colorizer.lua", event = "VeryLazy", config = true},
    {
        "ziontee113/color-picker.nvim",
        keys = {
            {
                "<C-c>",
                "<cmd>PickColorInsert<cr>",
                mode = "i",
                desc = "ColorPicker"
            }
        },
        config = true
    },
    {
        'akinsho/toggleterm.nvim',
        config = true,
        event = 'VeryLazy',
        opts = {direction = "float"}
    },
    {'mg979/vim-visual-multi', event = 'VeryLazy', branch = 'master'},
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
            ['javascriptreact'] = 'jsxRegion'
        }
        vim.g.closetag_shortcut = '>'
        vim.g.closetag_close_shortcut = '<leader>>'
        vim.g.closetag_enable_react_fragment = 1
    end
}

