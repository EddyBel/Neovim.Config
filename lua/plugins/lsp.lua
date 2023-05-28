return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local lspconfig = require('lspconfig')
        local util = require('lspconfig/util')

        ------------------------------------------------> AUXILIARY FUNCTIONS <---------------------------------------------------------------

        ---Gets the name of the executable with the appropriate extension according to the operating system.
        ---This function performs the following steps:
        ---1. Gets the operating system name using the first character of `package.config`.
        ---2. Converts the operating system name to lowercase.
        ---3. If the operating system is Windows ('character'), append the '.cmd' extension to the executable name.
        ---4. If the operating system is Linux or macOS ('/' character), returns the executable name unchanged.
        --
        ---@param executable string The executable name without extension.
        ---@return string newExecutable The name of the executable with the appropriate extension according to the operating system.
        --
        ---@example
        ---````lua
        ---local exeName = getExecutableName("myprogram")
        ---Gets the name of the executable with the appropriate extension according to the operating system.
        ---```
        function getExecutableName(executable)
            local os_name = string.lower(package.config:sub(1, 1)) -- Obtener el nombre del sistema operativo (windows: '\', linux y macOS: '/')

            -- Si wl sistema operativo es Windows entonces agrega al ejecutable la extención .cmd
            if os_name == '\\' then
                return executable .. ".cmd"
            else
                return executable
            end
        end

        ---Gets the current path where Neovim is running.
        ---This function uses the `vim.fn.getcwd()` function to get the current path.
        ---Returns the path where Neovim is opened.
        local function current_path(fname)
            return vim.fn.getcwd() -- Esta funcion obtiene la ruta donde se habre neovim
        end

        --------------------------------------> LSP CUSTOMER CONFIGURATIONS <-------------------------------------------------------

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true


        -- Python
        lspconfig.pyright.setup({
            cmd = { getExecutableName("pyright-langserver"), "--stdio" },
            filetypes = { "python" },
            root_dir = current_path,
            single_file_support = true,
            setting = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        })

        -- JavaScript, TypeScript, JavaScriptReact, TypescriptReact
        lspconfig.tsserver.setup({
            cmd = { getExecutableName("typescript-language-server"), "--stdio" },
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
                "typescript.tsx" },
            init_options = {
                hostInfo = "neovim"
            },
            root_dir = current_path,
            single_file_support = true
        })

        -- JSON
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            cmd = { getExecutableName("vscode-json-language-server"), "--stdio" },
            filetypes = { "json", "jsonc" },
            init_options = {
                provideFormatter = true
            },
            root_dir = current_path,
            single_file_support = true
        })

        -- CSS, SASS, SCSS, LESS
        lspconfig.cssls.setup({
            capabilities = capabilities,
            cmd = { getExecutableName("vscode-css-language-server"), "--stdio" },
            filetypes = { "css", "scss", "less" },
            root_dir = current_path,
            single_file_support = true,
            settings = {
                css = {
                    validate = true
                },
                less = {
                    validate = true
                },
                scss = {
                    validate = true
                }
            }
        })

        --HTML
        lspconfig.html.setup({
            capabilities = capabilities,
            cmd = { getExecutableName("vscode-html-language-server"), "--stdio" },
            filetypes = { "html" },
            init_options = {
                configurationSection = { "html", "css", "javascript" },
                embeddedLanguages = {
                    css = true,
                    javascript = true
                },
                provideFormatter = true
            },
            root_dir = current_path,
            single_file_support = true
        })
        lspconfig.emmet_ls.setup({
            cmd = { getExecutableName("emmet-ls"), "--stdio" },
            filetypes = { "astro", "eruby", "html", "htmldjango", "javascriptreact", "pug", "svelte", "typescriptreact",
                "vue" },
            root_dir = current_path,
            single_file_support = true
        })

        --BASH
        lspconfig.bashls.setup({
            cmd = { getExecutableName("bash-language-server"), "start" },
            filetypes = { "sh" },
            root_dir = current_path,
            settings = {
                bashIde = {
                    globPattern = "*@(.sh|.inc|.bash|.command)"
                }
            },
            single_file_support = true
        })

        --Lua
        lspconfig.lua_ls.setup({
            cmd = { getExecutableName("lua-language-server") },
            filetypes = { "lua" },
            log_level = 2,
            root_dir = current_path,
            single_file_support = true,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            }
        })

        --VIM
        lspconfig.vimls.setup({
            cmd = { getExecutableName("vim-language-server"), "--stdio" },
            filetypes = { "vim" },
            init_options = {
                diagnostic = {
                    enable = true
                },
                indexes = {
                    count = 3,
                    gap = 100,
                    projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
                    runtimepath = true
                },
                isNeovim = true,
                iskeyword = "@,48-57,_,192-255,-#",
                runtimepath = "",
                suggest = {
                    fromRuntimepath = true,
                    fromVimruntime = true
                },
                vimruntime = ""
            },
            root_dir = current_path,
            single_file_support = true
        })

        --Java
        lspconfig.jdtls.setup({
            cmd = { getExecutableName("jdtls"), "-configuration", "/home/user/.cache/jdtls/config", "-data",
                "/home/user/.cache/jdtls/workspace" },
            filetypes = { "java" },
            init_options = {
                jvm_args = {},
                workspace = "/home/user/.cache/jdtls/workspace"
            },
            root_dir = current_path,
            single_file_support = true
        })

        --Rust
        lspconfig.rust_analyzer.setup({
            cmd = { getExecutableName("rust-analyzer") },
            filetypes = { "rust" },
            root_dir = current_path,
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        enable = false,
                    }
                }
            }
        })

        --Go
        lspconfig.gopls.setup({
            cmd = { getExecutableName("gopls") },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = current_path,
            single_file_support = true
        })

        --C++ C Objective C
        lspconfig.clangd.setup({
            cmd = { getExecutableName("clangd") },
            capabilities = capabilities,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            root_dir = current_path,
            single_file_support = true
        })

        --Tailwindcss
        lspconfig.tailwindcss.setup({
            cmd = { getExecutableName("tailwindcss-language-server"), "--stdio" },
            autostart = false,
            root_dir = current_path,
            filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango",
                "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html",
                "html-eex",
                "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor",
                "slim",
                "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact",
                "reason",
                "rescript", "typescript", "typescriptreact", "vue", "svelte" },
            init_options = {
                userLanguages = {
                    eelixir = "html-eex",
                    eruby = "erb"
                }
            },
            settings = {
                tailwindCSS = {
                    classAttributes = { "class", "className", "classList", "ngClass" },
                    lint = {
                        cssConflict = "warning",
                        invalidApply = "error",
                        invalidConfigPath = "error",
                        invalidScreen = "error",
                        invalidTailwindDirective = "error",
                        invalidVariant = "error",
                        recommendedVariantOrder = "warning"
                    },
                    validate = true
                }
            }
        })

        --C#
        lspconfig.csharp_ls.setup({
            cmd = { getExecutableName("csharp-ls") },
            filetypes = { "cs" },
            init_options = {
                AutomaticWorkspaceInit = true
            },
            root_dir = current_path
        })

        --Dockerfile
        lspconfig.dockerls.setup({
            cmd = { getExecutableName("docker-langserver"), "--stdio" },
            filetypes = { "dockerfile" },
            root_dir = current_path,
            single_file_support = true
        })

        --Docker-Compose
        lspconfig.docker_compose_language_service.setup({
            cmd = { getExecutableName("docker-compose-langserver"), "--stdio" },
            filetypes = { "yaml" },
            root_dir = current_path,
            single_file_support = true
        })

        -- SQL, MYSQL
        lspconfig.sqlls.setup({
            cmd = { getExecutableName("sql-language-server"), "up", "--method", "stdio" },
            filetypes = { "sql", "mysql" },
            root_dir = current_path
        })


        --------------------------------------------> EXTRA STYLE SETTINGS <----------------------------------------------

        vim.diagnostic.config({
            virtual_text = {
                prefix = ICONS.prefix,
                spacing = 4,
            },
            signs = true,
            underline = true,
            update_in_insert = true
        })

        vim.fn.sign_define('DiagnosticSignError', {
            texthl = 'DiagnosticSignError',
            text = ICONS.error,
            numhl = ''
        })

        vim.fn.sign_define('DiagnosticSignWarn', {
            texthl = 'DiagnosticSignWarn',
            text = ICONS.warn,
            numhl = ''
        })

        vim.fn.sign_define('DiagnosticSignHint', {
            texthl = 'DiagnosticSignHint',
            text = ICONS.hint,
            numhl = ''
        })

        vim.fn.sign_define('DiagnosticSignInfo', {
            texthl = 'DiagnosticSignInfo',
            text = ICONS.info,
            numhl = ''
        })

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
