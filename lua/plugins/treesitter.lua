return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require("config.treesttier-colorizing-sintax")
    end
}
