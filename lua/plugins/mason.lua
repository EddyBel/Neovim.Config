return {
  {
    "williamboman/mason.nvim",
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
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "marksman",
          "pyright",
          "cssls",
          "jsonls",
          "emmet_ls",
          "html",
          "clangd",
          "tailwindcss",
          "bashls",
          "vimls",
          "dockerls",
          "sqlls",
          -- "csharp_ls",
          "gopls",
          "jdtls",
          "docker_compose_language_service"
        },
      })
    end
  }
}
