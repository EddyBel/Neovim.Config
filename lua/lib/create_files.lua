local files_manager = {}

--- Auxiliary functions

---This function creates a file in the current working directory.
---Checks if the file to create exists in the directory
---Sends a message or notification that the file has been created or can not be created
---@param name_file string Name of the file to be created
---@param content_file string Content of the file to be created
files_manager.create_file = function(name_file, content_file)
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

---Creates a directory tree according to the instructions of a table
---@param structure table Table denoting file structure
---@param directory string Directory where the structure will be created
files_manager.folders_structure = function(structure, directory)
    if directory == nil then directory = vim.fn.getcwd() end -- Obtener el directorio base si no se proporciona ningun directorio

    for key, value in pairs(structure) do
        if type(value) == "table" then
            local new_directory = directory .. "/" .. key
            vim.fn.mkdir(new_directory)
            files_manager.folders_structure(value, new_directory) -- llamada recursiva con el nuevo directorio
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

--- FILES PROPERTYS

files_manager.name_prettier = ".prettierrc"
files_manager.content_prettier = [[
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

files_manager.name_editorconfig = ".editorconfig"
files_manager.content_editorconfig = [[
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

files_manager.name_dockercompose = "docker-compose.yaml"
files_manager.content_dockercompose = [[
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

--- Folder structures

files_manager.structure_sass = {
    sass = {
        base = "directory",
        common = "directory",
        layouts = "directory",
        utils = "directory",
        global = "scss"
    }
}
files_manager.structure_node = {
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

_G.FILES_MANAGER = files_manager

--- Declare neovim commands

-- Files commands

vim.cmd(
    [[command! InitialPrettierrc lua FILES_MANAGER.create_file(FILES_MANAGER.name_prettier, FILES_MANAGER.content_prettier)]])
vim.cmd(
    [[command! InitialEditorconfig lua FILES_MANAGER.create_file(FILES_MANAGER.name_editorconfig, FILES_MANAGER.content_editorconfig)]])
vim.cmd(
    [[command! InitialDockercompose lua FILES_MANAGER.create_file(FILES_MANAGER.name_dockercompose, FILES_MANAGER.content_dockercompose)]])

-- Structures commands

vim.cmd(
    [[command! -nargs=1 InitialStructureSass lua FILES_MANAGER.folders_structure(FILES_MANAGER.structure_sass, <f-args>)]])
vim.cmd(
    [[command! -nargs=1 InitialStructureNode lua FILES_MANAGER.folders_structure(FILES_MANAGER.structure_node, <f-args>)]])
