---Esta función crea un archivo en el directorio de trabajo actual
---Valida si el archivo a crear existe en el directorio
---Envia un mensaje o notificación de que el archivo se a creado o no se puede crear
---@param name_file string Nombre del archivo a crear
---@param content_file string Contenido del archivo que se creara
function create_file(name_file, content_file)
  if vim.fn.filereadable(name_file) == 0 then
    local file = io.open(name_file, "w")
    file:write(content_file)
    file:close()
    vim.cmd(":Neotree")
    notification(name_file .. " created with default settings", "info")
  else
    notification(name_file .. " already exists", "warn")
  end
end

---Crea un arbol de direcotiorios segun las instrucciones de una tabla
---@param structure table Tabla que denife la estructura de archivos
---@param directory string Directorio donde se creara la estructura
function create_folders_structure(structure, directory)
  if directory == nil then directory = vim.fn.getcwd() end -- Obtener el directorio base si no se proporciona ningun directorio

  for key, value in pairs(structure) do
    if type(value) == "table" then
      local new_directory = directory .. "/" .. key
      vim.fn.mkdir(new_directory)
      create_folders_structure(value, new_directory) -- llamada recursiva con el nuevo directorio
    elseif value == "directory" then
      local new_directory = directory .. "/" .. key
      vim.fn.mkdir(new_directory)
    else
      local file = directory .. "/" .. key .. "." .. value
      local file = io.open(file, "w")
      file:write("New file")
      file:close()
    end
  end

  vim.cmd(":Neotree")
  notification("Structure created", "info")
end

-- Define los archivos a crear y su Contenido

vim.g.name_dockerfile_config = "dockerfile"
vim.g.content_dockerfile_config = [[
# Type the image that will use the container of your project
FROM image

# The work area will be the internal app folder.
WORKDIR /app

# Set the environment variables that you can use
ARG PORT=3000

# Time copy all project files to the work area.
COPY . /app

# Install the necessary requirements from the copied file.
RUN install command

# Specifies the port to expose.
EXPOSE 3000

# Execute the command to initialize the project.
CMD ["command", "param"]
]]

vim.g.name_prettier_config = ".prettierrc"
vim.g.content_prettier_config = [[
{
   "printWidth": 120,
   "tabWidth": 2,
   "useTabs": false,
   "semi": true,
   "singleQuote": true,
   "quoteProps": "as-needed",
   "jsxSingleQuote": false,
   "trailingComma": "all",
   "bracketSpacing": true,
   "jsxBracketSameLine": false,
   "arrowParens": "always",
   "requirePragma": false,
   "insertPragma": false,
   "proseWrap": "preserve",
   "vueIndentScriptAndStyle": false,
   "htmlWhitespaceSensitivity": "strict",
   "endOfLine": "lf",
   "overrides": [
      {
         "files": "*.md",
         "options": {
            "proseWrap": "always"
         }
      },
      {
         "files": "*.yaml",
         "options": {
            "tadWidth": 2,
            "printWidth": 40,
            "singleQuote": true
         }
      }
   ]
}]]

vim.g.name_editor_config = ".editorconfig"
vim.g.content_editor_config = [[
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

vim.g.name_dockercompose = "docker-compose.yaml"
vim.g.content_dockercompose = [[
# Specify the version of Docker Compose being used
version: '3'

# Define the services that will make up our application
services:
  # Configuration for the first service
  servicio1:
    # Specify the location of the Dockerfile to build the container
    build: ./directory_of_service1
    # Specify the ports that will be exposed in the container and on the host
    ports:
      - '8000:8000'
    # Specify the command to initialize the service
    command: initialization_command_for_service1

  # Configuration for the second service
  servicio2:
    # Specify the location of the Dockerfile to build the container
    build: ./directory_of_service2
    # Specify the ports that will be exposed in the container and on the host
    ports:
      - '8080:8080'
    # Specify the command to initialize the service
    command: initialization_command_for_service2
]]

-- Define las estructuras de archivos que vas a utilizar

vim.g.sass_estructure = {
  sass = {
    base = "directory",
    common = "directory",
    layouts = "directory",
    utils = "directory",
    global = "scss"
  }
}
vim.g.srcnode_estructure = {
  src = {
    controllers = "directory",
    models = "directory",
    routes = "directory",
    services = "directory"
  },
  public = "directory",
  tmp = "directory",
  index = "js"
}

vim.cmd("command! InitPrettierConfig lua create_file(vim.g.name_prettier_config, vim.g.content_prettier_config)") -- Crea el comando para crear un archivo prettierrc
vim.cmd("command! InitEditorConfig lua create_file(vim.g.name_editor_config, vim.g.content_editor_config)")       -- Crea el archivo inicial para editorconfig
vim.cmd("command! InitDockerfile lua create_file(vim.g.name_dockerfile_config, vim.g.content_dockerfile_config)") -- Crea el archivo inicial para dockerfile
vim.cmd("command! InitDockerCompose lua create_file(vim.g.name_dockercompose, vim.g.content_dockercompose)")      -- Crea el archivo inicial para docker-compose
vim.cmd("command! -nargs=1 InitSassEstructure lua create_folders_structure(vim.g.sass_estructure, <f-args>)")     -- Crea la estructura de archivos Sass
vim.cmd("command! -nargs=1 InitNodeEstructure lua create_folders_structure(vim.g.srcnode_estructure, <f-args>)")  -- Crea la estructura de archivos NodeJS
