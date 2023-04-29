return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "marksman", "pyright", "cssls", "jsonls", "emmet_ls",
        "html", "clangd", "tailwindcss", "bashls", "vimls" },
    })
  end
}
