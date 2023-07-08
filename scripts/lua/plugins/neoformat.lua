return {
    'sbdchd/neoformat',
    config = function()
        vim.g.neoformat_prefer_local_cfg = 1

        -- Comandos extra para cada lenguaje

        vim.g.neoformat_cpp_clangformat = {
            exe = "clang-format",
            args = { "--style=file" }
        }
        vim.g.neoformat_c_clangformat = {
            exe = "clang-format",
            args = { "--style=file" }
        }
        vim.g.neoformat_csharp_clangformat = {
            exe = "clang-format",
            args = { "--style=file" }
        }

        vim.g.neoformat_arduino_clangformat = {
            exe = "clang-format",
            args = { "--style=file" }
        }

        vim.g.neoformat_objc_clangformat = {
            exe = "clang-format",
            args = { "--style=file" }
        }

        vim.g.shfmt_opt = "-ci"

        vim.g.neoformat_enabled_javascript = CODE_FORMATTERS.javascript
        vim.g.neoformat_enabled_html = CODE_FORMATTERS.html
        vim.g.neoformat_enabled_css = CODE_FORMATTERS.css
        vim.g.neoformat_enabled_scss = CODE_FORMATTERS.scss
        vim.g.neoformat_enabled_typescriptreact = CODE_FORMATTERS.typescriptreact
        vim.g.neoformat_enabled_javascriptreact = CODE_FORMATTERS.javascriptreact
        vim.g.neoformat_enabled_json = CODE_FORMATTERS.json
        vim.g.neoformat_enabled_java = CODE_FORMATTERS.java
        vim.g.neoformat_enabled_kotlin = CODE_FORMATTERS.kotlin
        vim.g.neoformat_enabled_less = CODE_FORMATTERS.less
        vim.g.neoformat_enabled_markdown = CODE_FORMATTERS.markdown
        vim.g.neoformat_enabled_php = CODE_FORMATTERS.php
        vim.g.neoformat_enabled_ruby = CODE_FORMATTERS.ruby
        vim.g.neoformat_enabled_typescript = CODE_FORMATTERS.typescript
        vim.g.neoformat_enabled_xml = CODE_FORMATTERS.xml
        vim.g.neoformat_enabled_yaml = CODE_FORMATTERS.yaml
        vim.g.neoformat_enabled_lua = CODE_FORMATTERS.lua
        vim.g.neoformat_enabled_cpp = CODE_FORMATTERS.cpp
        vim.g.neoformat_enabled_c = CODE_FORMATTERS.c
        vim.g.neoformat_enabled_csharp = CODE_FORMATTERS.csharp
        vim.g.neoformat_enabled_go = CODE_FORMATTERS.go
        vim.g.neoformat_enabled_python = CODE_FORMATTERS.python
        vim.g.neoformat_enabled_arduino = CODE_FORMATTERS.arduino
        vim.g.neoformat_enabled_assembly = CODE_FORMATTERS.assembly
        vim.g.neoformat_enabled_bazel = CODE_FORMATTERS.bazel
        vim.g.neoformat_enabled_cmake = CODE_FORMATTERS.cmake
        vim.g.neoformat_enabled_csv = CODE_FORMATTERS.csv
        vim.g.neoformat_enabled_dart = CODE_FORMATTERS.dart
        vim.g.neoformat_enabled_erlang = CODE_FORMATTERS.erlang
        vim.g.neoformat_enabled_graphql = CODE_FORMATTERS.graphql
        vim.g.neoformat_enabled_toml = CODE_FORMATTERS.toml
        vim.g.neoformat_enabled_htmldjango = CODE_FORMATTERS.htmldjango
        vim.g.neoformat_enabled_vue = CODE_FORMATTERS.vue
        vim.g.neoformat_enabled_swift = CODE_FORMATTERS.swift
        vim.g.neoformat_enabled_sql = CODE_FORMATTERS.sql
        vim.g.neoformat_enabled_rust = CODE_FORMATTERS.rust
        vim.g.neoformat_enabled_sass = CODE_FORMATTERS.sass
        vim.g.neoformat_enabled_pug = CODE_FORMATTERS.pug
        vim.g.neoformat_enabled_objc = CODE_FORMATTERS.objc
        vim.g.neoformat_enabled_zsh = CODE_FORMATTERS.zsh
        vim.g.neoformat_enabled_svelte = CODE_FORMATTERS.svelte
        vim.g.neoformat_enabled_ps1 = CODE_FORMATTERS.ps1
        vim.g.neoformat_enabled_prisma = CODE_FORMATTERS.prisma
        vim.g.neoformat_enabled_jsonc = CODE_FORMATTERS.jsonc
        vim.g.neoformat_enabled_blade = CODE_FORMATTERS.blade
    end
}
