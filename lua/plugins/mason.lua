return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "marksman",
                    "pyright",
                    "cssls",
                    "jsonls",
                    "emmet_ls",
                    "html",
                    "tailwindcss"
                    -- "rust_analyzer",
                    -- "clangd",
                    -- "bashls",
                    -- "vimls",
                    -- "dockerls",
                    -- "sqlls",
                    -- "csharp_ls",
                    -- "gopls",
                    -- "jdtls",
                    -- "docker_compose_language_service"
                },
            })
        end
    }
}
