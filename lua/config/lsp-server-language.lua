-- Setup language servers.
local lspconfig = require('lspconfig')
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Opciones de configuración de los servidores de lenguaje

local opt = {
  root_dir = function(fname) return vim.fn.getcwd() end,
  autostart = true,
  single_file_soport = true,
}

local opt_cap = {
  capabilities = capabilities,
  root_dir = function(fname) return vim.fn.getcwd() end,
  autostart = true,
  single_file_soport = true,
}

local opt_root = {
  root_dir = function(fname) return vim.fn.getcwd() end
}

-- Inicializa los servidores lsp que se utilizaran
lspconfig.pyright.setup(opt)                       -- Python
lspconfig.tsserver.setup(opt)                      -- JavaScript Typescript JavaScriptReact TypescriptReact
lspconfig.jsonls.setup(opt_cap)                    -- JSON
lspconfig.cssls.setup(opt_cap)                     -- CSS, SASS, SCSS, LESS
lspconfig.html.setup(opt_cap)                      -- HTML
lspconfig.bashls.setup(opt_root)                   -- BASH
lspconfig.luau_lsp.setup(opt_root)                 -- Lua
lspconfig.lua_ls.setup(opt_root)                   -- Lua
lspconfig.vimls.setup(opt_root)                    -- Vim
lspconfig.dockerls.setup {}                        -- DOCKERFILE
lspconfig.docker_compose_language_service.setup {} -- Docker-Compose
lspconfig.emmet_ls.setup {
  root_dir = function(fname) return vim.fn.getcwd() end,
  autostart = true,
  filetypes = { "astro", "eruby", "html", "htmldjango", "javascriptreact", "pug", "svelte", "typescriptreact", "vue" },
  single_file_soport = true,
} -- HTML

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})


vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = true,
})

-- local signs = {
--   Error = "❌",
--   Warn = "⚠",
--   Hint = "🗨",
--   Info = "🧪",
-- }

-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
