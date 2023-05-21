return {
  'sbdchd/neoformat',
  config = function()
    vim.g.neoformat_prefer_local_cfg = 1

    -- Comando para ejecutar clang-format
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

    vim.g.neoformat_enabled_javascript = { 'prettier' }
    vim.g.neoformat_enabled_html = { 'prettier' }
    vim.g.neoformat_enabled_css = { 'prettier' }
    vim.g.neoformat_enabled_scss = { 'prettier' }
    vim.g.neoformat_enabled_typescriptreact = { 'prettier' }
    vim.g.neoformat_enabled_javascriptreact = { 'prettier' }
    vim.g.neoformat_enabled_json = { 'prettier' }
    vim.g.neoformat_enabled_java = { 'prettier' }
    vim.g.neoformat_enabled_kotlin = { 'prettier' }
    vim.g.neoformat_enabled_less = { 'prettier' }
    vim.g.neoformat_enabled_markdown = { 'prettier' }
    vim.g.neoformat_enabled_php = { 'prettier' }
    vim.g.neoformat_enabled_ruby = { 'prettier' }
    vim.g.neoformat_enabled_typescript = { 'prettier' }
    vim.g.neoformat_enabled_xml = { 'prettier' }
    vim.g.neoformat_enabled_yaml = { 'prettier' }
    vim.g.neoformat_enabled_lua = { 'luaformatter' }
    vim.g.neoformat_enabled_cpp = { 'clangformat' }
    vim.g.neoformat_enabled_c = { 'clangformat' }
    vim.g.neoformat_enabled_csharp = { 'clangformat' }
    vim.g.neoformat_enabled_go = { 'gofmt' }
    vim.g.neoformat_enabled_python = { 'black' }
  end
}
