---Esta funcion crea un archivo inicial de prettier si no existe uno previo
---Al ejecutarse buscara en la raiz del proyecto si ya existe un archivo .prettierrc
---Si no existe un archivo .prettierrc lo creara con una configuración precargada
function Init_prettier()
  -- Define el nombre del archivo y su contenido
  local prettierrc = "prettier.config.js"
  local prettierrc_content = [[
module.exports = {
  singleQuote: true,
  trailingComma: 'all',
  useTabs: false,
  tabWidth: 2,
  endOfLine: 'lf',
  overrides: [
    {
      files: '*.yaml',
      options: {
        tadWidth: 2,
        printWidth: 40,
        singleQuote: true,
      },
    },
  ],
};]]

  -- Busca en la raiz si el archivo existe.
  -- Si no existe entonces crealo con el contenido predefinido
  -- Muestra un mensaje si el archivo se a creado o si ya existe
  if vim.fn.filereadable(prettierrc) == 0 then
    local prettierrc_file = io.open(prettierrc, "w")
    prettierrc_file:write(prettierrc_content)
    prettierrc_file:close()
    notification(prettierrc .. " created with default settings", "info")
  else
    notification(prettierrc .. " already exists", "warn")
  end
end

---Esta funcion crea un archivo inicial de .editorconfig si no existe uno previo
---Al ejecutarse buscara en la raiz del proyecto si ya existe un archivo .editorconfig
---Si no existe un archivo .editorconfig lo creara con una configuración precargada
function Init_editor_config()
  -- Define el nombre del archivo y su contenido
  local editorconfig = ".editorconfig"
  local editorconfig_content = [[
# top-most EditorConfig file
root = true

# General
[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# Markdown files
[*.md]
max_line_length = off

# JavaScript files
[*.js]
# Change these values to match your project's coding style
indent_size = 2
indent_style = space]]

  -- Busca en la raiz si el archivo existe.
  -- Si no existe entonces crealo con el contenido predefinido
  -- Muestra un mensaje si el archivo se a creado o si ya existe
  if vim.fn.filereadable(editorconfig) == 0 then
    local editorconfig_file = io.open(editorconfig, "w")
    editorconfig_file:write(editorconfig_content)
    editorconfig_file:close()
    notification(editorconfig .. " created with default settings", "info")
  else
    notification(editorconfig .. " already exists", "warn")
  end
end

--- Crea la estructura de proyecto para sass utilizando scss
function Init_sass_estructure(directory)
  -- Si no se proporciona un directorio, se usa el directorio actual.
  if directory == nil then
    directory = vim.fn.getcwd()
  end

  -- Crea el directorio 'sass'.
  local sass_dir = directory .. "/sass"
  vim.fn.mkdir(sass_dir)

  -- Crea las subcarpetas 'base', 'common', 'layouts', y 'utils'.
  local subdirs = { "base", "common", "layouts", "utils" }
  for _, subdir in ipairs(subdirs) do
    local dir = sass_dir .. "/" .. subdir
    vim.fn.mkdir(dir)
  end

  -- Crea el archivo 'global.scss' dentro del directorio 'sass'.
  local global_scss = sass_dir .. "/global.scss"
  local file = io.open(global_scss, "w")
  file:write("// Archivo global de estilos\n")
  file:close()

  notification("Sass file structure created", "info")
end

vim.cmd("command! InitPrettierConfig lua Init_prettier()")                         -- Crea el comando para crear un archivo prettierrc
vim.cmd("command! InitEditorConfig lua Init_editor_config()")                      -- Crea el archivo inicial para editorconfig
vim.cmd("command! -nargs=1 InitSassEstructure lua Init_sass_estructure(<f-args>)") -- Crea la estructura de archivos Sass
