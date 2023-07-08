return {
    'akinsho/bufferline.nvim',
    config = function()
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = false
                    }
                }

            }
        })
    end
}
