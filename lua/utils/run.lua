----------------------------------> AUXILIARY FUNCTIONS <-----------------------------------------------------

---Add the ".exe" file extension to the filename if running on a Windows system.
---@param filename (string) The name of the file to which you want to append the ".exe" extension.
---@return (string) The name of the file with the ".exe" extension appended, if running on Windows. Otherwise, return the filename unchanged.
---@example
---````lua
---local file = appendExeExtension("program")
---print(file) -- Will print "program.exe" on Windows systems, or simply "program" on other operating systems.
---```
local function appendExeExtension(filename)
    if package.config:sub(1, 1) == "\\" then
        return filename .. ".exe"
    else
        return filename
    end
end

---Executes a command in the Vim terminal.
---@param command (string) The command to execute in the terminal.
---@example
---```lua
---run_in_terminal("ls -l")
---This will open a new terminal window in Vim and execute the command "ls -l".
--```
local function run_in_terminal(command)
    vim.cmd("vnew")
    vim.cmd("terminal " .. command)
    vim.api.nvim_feedkeys('i', 'n', false)
end


---Compile the code using the command provided.
---@param command (string) The command used to compile the code.
---@return (boolean) Returns true if the code compiles successfully, otherwise returns false.
---@example
---```lua
---local success = compile_code("gcc -o program file.c").
---if success then
---print("The code was compiled successfully.")
---else
---print("Error compiling code.")
---end
---```
local function compile_code(command)
    -- notification("Wait a moment, your code is compiling.", "info")
    local compileResult = os.execute(command)
    if compileResult ~= 0 then
        notification("An error occurred, your code could not be compiled.", "error")
        return false
    end
    notification("Your code has been successfully compiled", "info")
    return true
end

---Validates the extension of a file by comparing it with a provided extension.
---@param filename (string) The name of the file to validate.
---@param extension (string) The extension to compare with the file extension.
---@return (boolean) Returns true if the file extension matches the extension provided, otherwise returns false.
---@example
---````lua
---local isValid = validateExtension("file.txt", ".txt")
---if isValid then
---print("The file extension is valid.")
---else
--- print("The file extension is invalid.")
---end
---```
local function validateExtension(filename, extension)
    local length = #extension
    length = length * -1
    if filename:sub(length) ~= extension then
        notification("Invalid file", "error")
        return false
    end
    return true
end

---Create a new command by replacing the strings "INPUT" and "OUTPUT" with the values provided.
---@param input (string) The input value to replace in the string.
---@param output (string) The output value to replace in the string.
---@param string The original string containing the "INPUT" and "OUTPUT" keywords.
---@return (string) A new string where the "INPUT" and "OUTPUT" keywords have been replaced with the provided values.
---@example
---````lua
---local command = newCommand("input", "output", "The INPUT command generates OUTPUT.")
---print(command) -- Will print "The command input generates output."
---```
function newCommand(input, output, cadena)
    local newCommand = string.gsub(cadena, "INPUT", input)
    newCommand = string.gsub(newCommand, "OUTPUT", output)
    return newCommand
end

---Remove the extension of a given file and return the cleaned file name.
---@param namefile (string) The name of the file to be cleaned up.
---@param extension (string) The extension of the file to remove.
---@return (string) The clean filename without the specified extension.
---@example
---```lua
---local cleanFileName = cleanFile("file.txt", ".txt")
---print(cleanFileName) -- Will print "file".
---```
local function cleanFile(namefile, extension)
    local length = #extension
    length = (length + 1) * -1
    return namefile:sub(1, length)
end

--------------------------------------> COMPILATION AND EXECUTION FUNCTIONS <-----------------------------------------------

---
-- Run a current C++ file in a Vim terminal.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- Gets the clean filename without the ".cpp" extension.
-- 3. Validates if the file has the extension ".cpp".
-- Runs the compiler to compile the file.
-- Open a terminal and run the resulting binary.
--
-- Has no parameters or explicit return value.
--
-- Example of use:
-- exectCPPFile()
-- Executes the current C++ file in a Vim terminal.
---
function exectCPPFile()
    local currentFile = vim.api.nvim_buf_get_name(0)  -- Obten la ruta del archivo actual
    local outputFile = cleanFile(currentFile, ".cpp") -- Obten el nombre de archivo limpio

    -- Valida si el archivo es el adecuado
    local validate = validateExtension(currentFile, ".cpp") -- Verificar si el archivo tiene extensión .cpp
    if not validate then return end

    -- Ejecuta el compilador
    local command = newCommand(currentFile, outputFile, COMPILERS_EXECUTABLES.cpp)
    local compile = compile_code(command)
    if not compile then return end

    -- Abrir una terminal y ejecutar el binario resultante
    run_in_terminal(appendExeExtension(outputFile))
end

---
-- Run a current Python file in a Vim terminal.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- 2. Validates whether the file has the extension ".py".
-- 3. Executes the command to run the Python program in a terminal.
--
-- Has no parameters or explicit return value.
--
-- Example of use:
-- exectPythonFile()
-- Executes the current Python file in a Vim terminal.
---
function exectPythonFile()
    local currentFile = vim.api.nvim_buf_get_name(0) -- Obten la ruta del archivo actual

    -- Valida la extension del archivo
    local validate = validateExtension(currentFile, ".py")
    if not validate then return end

    -- Ejecuta el comando para correr el programa de python
    local command = string.gsub(COMPILERS_EXECUTABLES.python, "INPUT", currentFile)
    run_in_terminal(command)
end

---
-- Execute a current JavaScript file in a Vim terminal.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- 2. Validates if the file has the extension ".js".
-- Executes the command to run the JavaScript program in a terminal.
--
-- Has no parameters or explicit return value.
--
-- Example of use:
-- exectJavaScriptFile().
-- Executes the current JavaScript file in a Vim terminal.
---
function exectJavaScriptFile()
    local currentFile = vim.api.nvim_buf_get_name(0) -- Obten la ruta del archivo actual

    -- Valida la extension del archivo
    local validate = validateExtension(currentFile, ".js")
    if not validate then return end

    -- Ejecuta el comando para correr el programa
    local command = string.gsub(COMPILERS_EXECUTABLES.javascript, "INPUT", currentFile)
    run_in_terminal(command)
end

---
-- Execute a current TypeScript file in a Vim terminal.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- Gets the clean filename without the ".ts" extension.
-- 3. Validates if the file has the extension ".ts".
-- Runs the compiler to compile the TypeScript file.
-- Runs the resulting JavaScript file in a terminal.
--
-- Has no explicit parameters or return value.
--
-- Example usage:
-- exectTypeScriptFile()
-- Executes the current TypeScript file in a Vim terminal.
---
function exectTypeScriptFile()
    local currentFile = vim.api.nvim_buf_get_name(0) -- Obten la ruta del archivo actual
    local outputFile = cleanFile(currentFile, ".ts") -- Obten el nombre de archivo limpio

    local validate = validateExtension(currentFile, ".ts")
    if not validate then return end

    local commandTS = string.gsub(COMPILERS_EXECUTABLES.typescript, "INPUT", currentFile)
    local compile = compile_code(commandTS)
    if not compile then return end

    local commandJS = string.gsub(COMPILERS_EXECUTABLES.javascript, "INPUT", outputFile .. ".js")
    run_in_terminal(commandJS)
end

---
-- Compiles and executes a current SCSS file in Vim.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- 2. Clears the file name without the ".scss" extension.
-- Validates if the file has the ".scss" extension.
-- Compile the SCSS file using the SASS compiler.
-- Displays a notification that the compilation was successful.
--
-- Has no explicit parameters or return value.
--
-- Usage example:
-- exectScssFile().
-- Compiles and executes the current SCSS file in Vim.
---
function exectScssFile()
    local currentFile = vim.api.nvim_buf_get_name(0)   -- Obten la ruta del archivo actual
    local outputFile = cleanFile(currentFile, ".scss") -- Limpia el archivo sin extensión

    -- Valida la extensión del archivo
    local validate = validateExtension(currentFile, ".scss")
    if not validate then return end

    -- Compila el archivo SCSS
    local command = newCommand(currentFile, outputFile, COMPILERS_EXECUTABLES.sass)
    local compile = compile_code(command)
    if not compile then return end
end

---
-- Compiles and executes an actual C file in Vim.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- 2. Clears the file name without the ".c" extension.
-- Validates whether the file has the ".c" extension.
-- Compile the C file using the C compiler.
-- Run the resulting executable file in a terminal.
--
-- Has no parameters or explicit return value.
--
-- Example of use:
-- exectCFile()
-- Compiles and executes the current C file in Vim.
---
function exectCFile()
    local currentFile = vim.api.nvim_buf_get_name(0) -- Obten la ruta del archivo actual
    local outputFile = cleanFile(currentFile, ".c")

    -- Valida que el archivo sea valido
    local validate = validateExtension(currentFile, ".c")
    if not validate then return end

    -- Compila el archivo resultante
    local command = newCommand(currentFile, outputFile, COMPILERS_EXECUTABLES.c)
    local compile = compile_code(command)
    if not compile then return end

    -- Ejecuta el ejecutable resultante
    run_in_terminal(appendExeExtension(outputFile))
end

---
-- Compiles and executes a current Go file in Vim.
--
-- This function performs the following steps:
-- 1. Gets the path to the current file.
-- 2. Clears the file name without the ".go" extension.
-- Validates whether the file has the ".go" extension.
-- Compile the Go file using the Go compiler.
-- Run the resulting executable file in a terminal.
--
-- Has no parameters or explicit return value.
--
-- Example of use:
-- exectGoFile()
-- Compiles and executes the current Go file in Vim.
---
function exectGoFile()
    local currentFile = vim.api.nvim_buf_get_name(0) -- Obten la ruta del archivo actual
    local outputFile = cleanFile(currentFile, ".go")

    -- Valida que el archivo sea valido
    local validate = validateExtension(currentFile, ".go")
    if not validate then return end

    -- Compila el archivo resultante
    local command = string.gsub(COMPILERS_EXECUTABLES.go, "INPUT", currentFile)
    local compile = compile_code(command)
    if not compile then return end

    -- Ejecuta el ejecutable resultante
    run_in_terminal(appendExeExtension(outputFile))
end

function OpenHTMLInBrowser()
    -- Obtén el nombre del archivo actual
    local current_file = vim.fn.expand('%:p')

    -- Verifica si el archivo es un archivo HTML
    local validation = validateExtension(current_file, ".html")
    if not validation then return end

    -- Construye el comando de apertura del navegador según el sistema operativo
    local cmd = ""

    if vim.fn.has("mac") == 1 then
        cmd = "open"
    elseif vim.fn.has("unix") == 1 then
        cmd = "xdg-open"
    elseif vim.fn.has("win32") == 1 then
        cmd = "start"
    else
        notification("Cannot determine the command to open the browser on this operating system.", "warn")
        return
    end

    -- Ejecuta el comando para abrir el archivo HTML en el navegador
    local open_cmd = cmd .. " " .. current_file
    vim.fn.jobstart(open_cmd, { detach = true })
    notification("HTML file opened correctly.", "info")
end

-------------------------------------> ASSIGNS COMMANDS TO EXECUTE THE FUNCTIONS <--------------------------------------------------------

vim.cmd("command! RunCPP lua exectCPPFile()")
vim.cmd("command! RunC lua exectCFile()")
vim.cmd("command! RunPython lua exectPythonFile()")
vim.cmd("command! RunJavaScript lua exectJavaScriptFile()")
vim.cmd("command! RunTypeScript lua exectTypeScriptFile()")
vim.cmd("command! RunScss lua exectScssFile()")
vim.cmd("command! RunGo lua exectGoFile()")
vim.cmd("command! OpenHTML lua OpenHTMLInBrowser()")
