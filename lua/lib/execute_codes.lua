local windows_executable = ".exe"
local run_code = {}

---This variable stores the commands used by the functions to execute or compile code.
---The INPUT string defines the input file name
---The string OUTPUT defines the output file name
run_code.compilers_executables = {
    python = "python INPUT",
    javascript = "node INPUT",
    typescript = "tsc INPUT",
    sass = "sass INPUT OUTPUT.css",
    cpp = "g++ INPUT -o OUTPUT",
    c = "gcc INPUT -o OUTPUT",
    go = "go build INPUT"
}

-- Auxiliary functions

---Executes a command in the Vim terminal.
---@param command (string) The command to execute in the terminal.
run_code.run_terminal = function(command)
    vim.cmd("vnew")
    vim.cmd("terminal " .. command)
    vim.api.nvim_feedkeys('i', 'n', false)
end

---Executes a command in the Vim terminal.
---@param command (string) The command to execute in the terminal.
run_code.compile_code = function(command)
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
run_code.validate_extension = function(filename, extension)
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
run_code.new_command = function(input, output, cadena)
    local newCommand = string.gsub(cadena, "INPUT", input)
    newCommand = string.gsub(newCommand, "OUTPUT", output)
    return newCommand
end

---Remove the extension of a given file and return the cleaned file name.
---@param namefile (string) The name of the file to be cleaned up.
---@param extension (string) The extension of the file to remove.
---@return (string) The clean filename without the specified extension.
run_code.clean_file = function(namefile, extension)
    local length = #extension
    length = (length + 1) * -1
    return namefile:sub(1, length)
end

-- Functions that execute the code

run_code.run_python = function()
    -- Defines the file extension
    -- Get the full path to the current file
    local extension = ".py"
    local currentFile = vim.api.nvim_buf_get_name(0)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Run the resulting executable in the terminal
    local command = string.gsub(run_code.compilers_executables.python, "INPUT", currentFile)
    run_code.run_terminal(command)
end

run_code.run_javascript = function()
    -- Defines the file extension
    -- Get the full path to the current file
    local extension = ".js"
    local currentFile = vim.api.nvim_buf_get_name(0)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Run the resulting executable in the terminal
    local command = string.gsub(run_code.compilers_executables.javascript, "INPUT", currentFile)
    run_code.run_terminal(command)
end

run_code.run_typescript = function()
    -- Defines the file extension
    -- Get the full path to the current file
    -- Clean the file by removing its extension
    local extension = ".ts"
    local currentFile = vim.api.nvim_buf_get_name(0)
    local outputFile = run_code.clean_file(currentFile, extension)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    local command_typescript = string.gsub(run_code.compilers_executables.typescript, "INPUT", currentFile)
    local compile = run_code.compile_code(command_typescript)
    if not compile then return end

    local command_javascript = string.gsub(run_code.compilers_executables.javascript, "INPUT", outputFile .. ".js")
    run_code.run_terminal(command_javascript)
end

run_code.run_cpp = function()
    -- Defines the file extension
    -- Get the full path to the current file
    -- Clean the file by removing its extension
    local extension = ".cpp"
    local currentFile = vim.api.nvim_buf_get_name(0)
    local outputFile = run_code.clean_file(currentFile, extension)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Run the code compiler
    local command = run_code.new_command(currentFile, outputFile, run_code.compilers_executables.cpp)
    local compile = run_code.compile_code(command)
    if not compile then return end

    -- Run the resulting executable in the terminal
    run_code.run_terminal(UTILS.get_executable_extension(outputFile, windows_executable))
end

run_code.run_c = function()
    -- Defines the file extension
    -- Get the full path to the current file
    -- Clean the file by removing its extension
    local extension = ".c"
    local currentFile = vim.api.nvim_buf_get_name(0)
    local outputFile = run_code.clean_file(currentFile, extension)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Run the code compiler
    local command = run_code.new_command(currentFile, outputFile, run_code.compilers_executables.c)
    local compile = run_code.compile_code(command)
    if not compile then return end

    -- Run the resulting executable in the terminal
    run_code.run_terminal(UTILS.get_executable_extension(outputFile, windows_executable))
end

run_code.run_go = function()
    -- Defines the file extension
    -- Get the full path to the current file
    -- Clean the file by removing its extension
    local extension = ".go"
    local currentFile = vim.api.nvim_buf_get_name(0)
    local outputFile = run_code.clean_file(currentFile, extension)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    local command = string.gsub(run_code.compilers_executables.go, "INPUT", currentFile)
    local compile = run_code.compile_code(command)
    if not compile then return end

    run_code.run_terminal(UTILS.get_executable_extension(outputFile, windows_executable))
end

run_code.run_scss = function()
    -- Defines the file extension
    -- Get the full path to the current file
    -- Clean the file by removing its extension
    local extension = ".scss"
    local currentFile = vim.api.nvim_buf_get_name(0)
    local outputFile = run_code.clean_file(currentFile, extension)

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Run the code compiler
    local command = run_code.new_command(currentFile, outputFile, run_code.compilers_executables.sass)
    local compile = run_code.compile_code(command)
    if not compile then return end
end

run_code.open_html = function()
    local command = ""
    local extension = ".html"
    local currentFile = vim.fn.expand('%:p')

    -- Validate that the file extension is correct
    local validate = run_code.validate_extension(currentFile, extension)
    if not validate then return end

    -- Construye el comando de apertura del navegador según el sistema operativo
    if ENV.OS == ENV.WINDOWS then
        command = "start"
    elseif ENV.OS == ENV.LINUX then
        command = "xdg-open"
    elseif ENV.OS == ENV.MACOS then
        command = "open"
    else
        notification("Cannot determine the command to open the browser on this operating system.", "warn")
        return
    end

    -- Ejecuta el comando para abrir el archivo HTML en el navegador
    local command = command .. " " .. currentFile
    vim.fn.jobstart(command, { detach = true })
    notification("HTML file opened correctly.", "info")
end

_G.RUN_CODE = run_code

-- Assign the commands to be executed by the compilers

vim.cmd([[command! RunPython lua RUN_CODE.run_python()]])
vim.cmd([[command! RunJavascript lua RUN_CODE.run_javascript()]])
vim.cmd([[command! RunTypescript lua RUN_CODE.run_typescript()]])
vim.cmd([[command! RunCPP lua RUN_CODE.run_cpp()]])
vim.cmd([[command! RunC lua RUN_CODE.run_c()]])
vim.cmd([[command! RunScss lua RUN_CODE.run_scss()]])
vim.cmd([[command! RunGo lua RUN_CODE.run_go()]])
vim.cmd([[command! OpenHTML lua RUN_CODE.open_html()]])
