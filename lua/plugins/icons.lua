return {
  'nvim-tree/nvim-web-devicons',
  opts = {
    color_icons = true,
    default = true,
    strict = false,
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      },
      js = {
        icon = "",
        color = "#f1e05a",
        cterm_color = '220',
        name = "Js"
      },
      py = {
        icon = "",
        color = "#2980B9",
        name = "Py"
      },
      cs = {
        icon = "󰌛",
        color = "#BB8FCE",
        name = "Cs"
      }
    },
    override_by_filename = {
      [".editorconfig"] = {
        icon = "",
        color = "#F8F9F9",
        name = "Editorconfig"
      },
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore"
      },
      ['prettier.config.js'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigJS'
      },
      ['.prettierrc'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigRC'
      },
      ['.prettierrc.json'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigJSON'
      },
      ['.prettierrc.yml'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigYML'
      },
      ['.prettierrc.yaml'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigYAML'
      },
      ['.prettierrc.js'] = {
        icon = '󰫽',
        color = '#61affe',
        name = 'PrettierConfigJS'
      },
      ['.eslintrc.js'] = {
        icon = '󰱺',
        color = '#D2B4DE',
        name = 'EslintJS'
      },
      ['.eslintrc.cjs'] = {
        icon = '󰱺',
        color = '#D2B4DE',
        name = 'EslintCJS'
      },
      ['.eslintrc.yaml'] = {
        icon = '󰱺',
        color = '#D2B4DE',
        name = 'EslintYAML'
      },
      ['.eslintrc.json'] = {
        icon = '󰱺',
        color = '#D2B4DE',
        name = 'EslintJSON'
      },
      ['README.md'] = {
        icon = '',
        color = '#85C1E9',
        name = 'ReadmeFile'
      },
      ['readme.md'] = {
        icon = '',
        color = '#85C1E9',
        name = 'ReadmeFILE'
      },
      ['LICENSE'] = {
        icon = "󰿃",
        color = "#EC7063",
        name = "LICENSE"
      },
      ['node_modules'] = {
        icon = '',
        color = '#EC7063',
        name = 'NodeModules'
      },
    },
    override_by_extension = {
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log"
      },
      ['test.js'] = {
        icon = '',
        color = '#85C1E9',
        cterm_color = '220',
        name = 'TestJavascript',
      },
      ['test.py'] = {
        icon = '',
        color = '#85C1E9',
        cterm_color = '220',
        name = 'TestJavascript',
      },
      ['test.tsx'] = {
        icon = '',
        color = '#85C1E9',
        cterm_color = '220',
        name = 'TestJavascript',
      },
      ['test.jsx'] = {
        icon = '',
        color = '#85C1E9',
        cterm_color = '220',
        name = 'TestJavascript',
      },
      ['test.java'] = {
        icon = '',
        color = '#85C1E9',
        cterm_color = '220',
        name = 'TestJavascript',
      },
    },
  }
}
