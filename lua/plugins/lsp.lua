return {
    "neovim/nvim-lspconfig",
    -- "mfussenegger/nvim-jdtls",
    config = function()
        require("config.lsp-server-language")
    end
}
