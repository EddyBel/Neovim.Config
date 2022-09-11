local lspconfig = require 'lspconfig'
local lspinstaller = require 'nvim-lsp-installer'

-- LSP-SERVER-LENGUAGES
lspconfig.tsserver.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- JavaScript, TS, React
lspconfig.pyright.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- Python
lspconfig.html.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- Html
lspconfig.tailwindcss.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- TAILWINCSS
lspconfig.sqls.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- SQL, MYSQL
lspconfig.marksman.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} -- Markdown
lspconfig.sumneko_lua.setup{{
	on_attach = on_attach,
	flags = lsp_flags,
}} --Lua
lspconfig.intelephense.setup({
	on_attach = on_attach,
	flags = lsp_flags,
}) --PHP
-- FIN-SERVER-LENGUAGES


--LSP-INSTALLER
lspinstaller.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
--FIN-LSP-INSTALLER
