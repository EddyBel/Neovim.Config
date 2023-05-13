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
    lspconfig.csharp_ls.setup(opts)                    -- C#
    lspconfig.dockerls.setup {}                        -- DOCKERFILE
    lspconfig.docker_compose_language_service.setup {} -- Docker-Compose
    lspconfig.sqlls.setup(opts)                        -- SQL, MYSQL
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

    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    sign({ name = 'DiagnosticSignError', text = '│E' })
    sign({ name = 'DiagnosticSignWarn', text = '│W' })
    sign({ name = 'DiagnosticSignHint', text = '│H' })
    sign({ name = 'DiagnosticSignInfo', text = '│I' })

    -- Agrega configuraciónes de la ventana que usa lsp para mostrar la información de la sintaxis
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = 'rounded' }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = 'rounded' }
    )
  end
}
