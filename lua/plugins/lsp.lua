return {
  "neovim/nvim-lspconfig",
  -- "mfussenegger/nvim-jdtls",
  config = function()
    -- Importa el modulo lspconfig a utilizar
    local lspconfig = require('lspconfig')
    local util = require('lspconfig/util')

    -- Opciones de configuración de los servidores de lenguaje
    local capabilities = vim.lsp.protocol.make_client_capabilities()          -- Obten las configuraciones del cliente
    capabilities.textDocument.completion.completionItem.snippetSupport = true -- Habilita el soporte de snippets
    local current_path = function(fname) return vim.fn.getcwd() end           -- Esta funcion obtiene la ruta donde se habre neovim
    local opts = {}                                                           -- En este objeto se guardaran las opciones de los servidores

    -- Agrega las propiedades necesarias del objeto opciones
    opts.root_dir = current_path
    opts.autostart = true
    opts.single_file_soport = true
    opts.capabilities = capabilities


    -- Inicializa los servidores lsp que se utilizaran
    lspconfig.pyright.setup(opts)                      -- Python
    lspconfig.tsserver.setup(opts)                     -- JavaScript Typescript JavaScriptReact TypescriptReact
    lspconfig.jsonls.setup(opts)                       -- JSON
    lspconfig.cssls.setup(opts)                        -- CSS, SASS, SCSS, LESS
    lspconfig.html.setup(opts)                         -- HTML
    lspconfig.bashls.setup(opts)                       -- BASH
    lspconfig.luau_lsp.setup(opts)                     -- Lua
    lspconfig.lua_ls.setup(opts)                       -- Lua
    lspconfig.vimls.setup(opts)                        -- Vim
    lspconfig.jdtls.setup(opts)                        -- Java
    lspconfig.rust_analyzer.setup(opts)                -- Rust
    lspconfig.gopls.setup(opts)                        -- Go
    lspconfig.clangd.setup(opts)                       -- C++, C, Objective C
    lspconfig.tailwindcss.setup(opts)                  -- Tailwindcss
    lspconfig.dockerls.setup {}                        -- DOCKERFILE
    lspconfig.docker_compose_language_service.setup {} -- Docker-Compose

    opts.filetypes = { "astro", "eruby", "html", "htmldjango", "javascriptreact", "pug", "svelte", "typescriptreact",
      "vue" }
    lspconfig.emmet_ls.setup(opts) -- HTML

    -- Modifica algunos aspectos de como se muestran los comentarios de sintaxis del lenguaje
    -- Modifica cosas del aspecto
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = true
    })

    --local sign = function(opts)
    --  vim.fn.sign_define(opts.name, {
    --    texthl = opts.name,
    --    text = opts.text,
    --    numhl = ''
    --  })
    --end

    --sign({ name = 'DiagnosticSignError', text = '✘' })
    --sign({ name = 'DiagnosticSignWarn', text = '▲' })
    --sign({ name = 'DiagnosticSignHint', text = '⚑' })
    --sign({ name = 'DiagnosticSignInfo', text = '' })

    -- Agrega configuraciónes de la ventana que usa lsp para mostrar la información de la sintaxis
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = 'rounded' }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = 'rounded' }
    )

    -- Global mappings.
    -- Este fragmento de código define un autocmd (comando automático) para cuando un servidor LSP (Language Server Protocol) se adjunta a un buffer en Neovim. El código establece una serie de opciones para el servidor LSP que se adjunta al buffer, como la habilitación de la función de autocompletado y la definición de mapeos de teclas para varias funciones proporcionadas por el servidor LSP, como ir a la definición o listar referencias.
    -- vim.api.nvim_create_autocmd('LspAttach', {
    -- group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    -- callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- end,
    -- })
  end
}
