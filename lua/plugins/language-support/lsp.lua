return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local lspconfig = require('lspconfig')
        local util = require('lspconfig/util')
        local windows_extension = ".cmd"
        local linux_extension = ""
        local macos_extension = ""
        local root_pattern = util.root_pattern

        --------------------------------------> LSP CUSTOMER CONFIGURATIONS <-------------------------------------------------------

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem = {
            documentationFormat = { "markdown", "plaintext" },
            snippetSupport = true,
            preselectSupport = true,
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            deprecatedSupport = true,
            commitCharactersSupport = true,
            tagSupport = { valueSet = { 1 } },
            resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" }
            }
        }

        -- Python
        lspconfig.pyright.setup({
            cmd = {
                UTILS.get_executable_extension("pyright-langserver",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "python" },
            root_dir = UTILS.current_path,
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
            capabilities = capabilities,
            cmd = {
                UTILS.get_executable_extension("typescript-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = {
                "javascript", "javascriptreact", "javascript.jsx", "typescript",
                "typescriptreact", "typescript.tsx"
            },
            init_options = { hostInfo = "neovim" },
            root_dir = UTILS.current_path,
            single_file_support = true,
            settings = {
                javascript = {
                    format = {
                        enable = true,
                        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                        insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
                        insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
                        insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
                        insertSpaceAfterTypeAssertion = false,
                        placeOpenBraceOnNewLineForFunctions = false,
                        placeOpenBraceOnNewLineForControlBlocks = false
                    },
                    suggest = {
                        autoImport = true,
                        includeCompletionsForModuleExports = true,
                        names = true
                    }
                },
                typescript = {
                    format = {
                        enable = true,
                        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                        insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
                        insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
                        insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
                        insertSpaceAfterTypeAssertion = false,
                        placeOpenBraceOnNewLineForFunctions = false,
                        placeOpenBraceOnNewLineForControlBlocks = false
                    },
                    suggest = {
                        autoImport = true,
                        includeCompletionsForModuleExports = true,
                        names = true
                    }
                }
            }
        })

        -- JSON
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            cmd = {
                UTILS.get_executable_extension("vscode-json-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "json", "jsonc" },
            init_options = { provideFormatter = true },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- CSS, SASS, SCSS, LESS
        lspconfig.cssls.setup({
            capabilities = capabilities,
            cmd = {
                UTILS.get_executable_extension("vscode-css-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "css", "scss", "less" },
            root_dir = UTILS.current_path,
            single_file_support = true,
            settings = {
                css = { validate = true },
                less = { validate = true },
                scss = { validate = true }
            }
        })

        -- HTML
        lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            cmd = {
                UTILS.get_executable_extension("emmet-ls", windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = {
                "astro", "eruby", "html", "htmldjango", "javascriptreact",
                "pug", "svelte", "typescriptreact", "vue"
            },
            root_dir = UTILS.current_path,
            single_file_support = true
        })
        -- lspconfig.html.setup({
        --     capabilities = capabilities,
        --     cmd = { UTILS.get_executable_extension("vscode-html-language-server", windows_extension), "--stdio" },
        --     filetypes = { "html", "javascript" },
        --     init_options = {
        --         configurationSection = { "html", "css", "javascript" },
        --         embeddedLanguages = {
        --             css = true,
        --             javascript = true
        --         },
        --         provideFormatter = true
        --     },
        --     root_dir = UTILS.current_path,
        --     single_file_support = true
        -- })

        -- BASH
        lspconfig.bashls.setup({
            cmd = {
                UTILS.get_executable_extension("bash-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "start"
            },
            filetypes = { "sh" },
            root_dir = UTILS.current_path,
            settings = { bashIde = { globPattern = "*@(.sh|.inc|.bash|.command)" } },
            single_file_support = true
        })

        -- Lua
        lspconfig.lua_ls.setup({
            cmd = {
                UTILS.get_executable_extension("lua-language-server",
                    windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "lua" },
            log_level = 2,
            root_dir = UTILS.current_path,
            single_file_support = true,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' }
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = { enable = false }
                }
            }
        })

        -- VIM
        lspconfig.vimls.setup({
            cmd = {
                UTILS.get_executable_extension("vim-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "vim" },
            init_options = {
                diagnostic = { enable = true },
                indexes = {
                    count = 3,
                    gap = 100,
                    projectRootPatterns = {
                        "runtime", "nvim", ".git", "autoload", "plugin"
                    },
                    runtimepath = true
                },
                isNeovim = true,
                iskeyword = "@,48-57,_,192-255,-#",
                runtimepath = "",
                suggest = { fromRuntimepath = true, fromVimruntime = true },
                vimruntime = ""
            },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- Java
        lspconfig.jdtls.setup({
            cmd = {
                UTILS.get_executable_extension("jdtls", windows_extension,
                    linux_extension, macos_extension),
                "-configuration", "/home/user/.cache/jdtls/config", "-data",
                "/home/user/.cache/jdtls/workspace"
            },
            filetypes = { "java" },
            init_options = {
                jvm_args = {},
                workspace = "/home/user/.cache/jdtls/workspace"
            },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- Rust
        lspconfig.rust_analyzer.setup({
            cmd = {
                UTILS.get_executable_extension("rust-analyzer",
                    windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "rust" },
            root_dir = UTILS.current_path,
            settings = { ['rust-analyzer'] = { diagnostics = { enable = false } } }
        })

        -- Go
        lspconfig.gopls.setup({
            cmd = {
                UTILS.get_executable_extension("gopls", windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- C++ C Objective C
        lspconfig.clangd.setup({
            cmd = {
                UTILS.get_executable_extension("clangd", windows_extension,
                    linux_extension, macos_extension)
            },
            capabilities = capabilities,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- Tailwindcss
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            cmd = { UTILS.get_executable_extension("tailwindcss-language-server", windows_extension, linux_extension, macos_extension), "--stdio" },
            root_dir = root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs',
                'tailwind.config.ts', 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.mjs',
                'postcss.config.ts', 'package.json', 'node_modules', '.git'),
            filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            settings = {
                tailwindCSS = {
                    includeLanguages = {
                        eelixir = "html-eex",
                        eruby = "erb"
                    },
                    classAttributes = { "class", "className", "classNames", "classList", "ngClass" },
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


        -- C#
        lspconfig.csharp_ls.setup({
            cmd = {
                UTILS.get_executable_extension("csharp-ls", windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "cs" },
            init_options = { AutomaticWorkspaceInit = true },
            root_dir = UTILS.current_path
        })

        -- Dockerfile
        lspconfig.dockerls.setup({
            cmd = {
                UTILS.get_executable_extension("docker-langserver",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "dockerfile" },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- Docker-Compose
        lspconfig.docker_compose_language_service.setup({
            cmd = {
                UTILS.get_executable_extension("docker-compose-langserver",
                    windows_extension,
                    linux_extension, macos_extension),
                "--stdio"
            },
            filetypes = { "yaml" },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- SQL, MYSQL
        lspconfig.sqlls.setup({
            cmd = {
                UTILS.get_executable_extension("sql-language-server",
                    windows_extension,
                    linux_extension, macos_extension),
                "up", "--method", "stdio"
            },
            filetypes = { "sql", "mysql" },
            root_dir = UTILS.current_path
        })

        -- Markdown
        lspconfig.marksman.setup({
            cmd = {
                UTILS.get_executable_extension("marksman", windows_extension,
                    linux_extension, macos_extension),
                "server"
            },
            filetypes = { "markdown" },
            root_dir = UTILS.current_path,
            single_file_support = true
        })

        -- Arduino
        lspconfig.arduino_language_server.setup({
            cmd = {
                UTILS.get_executable_extension("arduino-language-server",
                    windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "arduino" },
            root_dir = UTILS.current_path
        })

        -- Assembly
        lspconfig.asm_lsp.setup({
            cmd = {
                UTILS.get_executable_extension("asm-lsp", windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "asm", "vmasm" },
            root_dir = UTILS.current_path
        })

        -- Kotlin
        lspconfig.kotlin_language_server.setup({
            cmd = {
                UTILS.get_executable_extension("kotlin-language-server",
                    windows_extension,
                    linux_extension, macos_extension)
            },
            filetypes = { "kotlin" },
            root_dir = UTILS.current_path
        })


        -- Prisma
        require 'lspconfig'.prismals.setup {
            root_dir = UTILS.current_path
        }

        --------------------------------------------> EXTRA STYLE SETTINGS <----------------------------------------------

        vim.diagnostic.config({
            virtual_text = { prefix = ICONS.prefix, spacing = 4 },
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

        vim.lsp.handlers['textDocument/hover'] =
            vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

        vim.lsp.handlers['textDocument/signatureHelp'] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    end
}
