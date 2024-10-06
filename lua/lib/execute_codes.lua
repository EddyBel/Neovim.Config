local run_code = {}

local is_windows = ENV.OS == ENV.WINDOWS

run_code.compilers_executables = {
    cpp = "g++ INPUT -o OUTPUT",
    c = "gcc INPUT -o OUTPUT",
    go = "go build INPUT",
    java = "javac INPUT"
}

run_code.exec_commands = {
    python = "python3 INPUT.py",
    javascript = "node INPUT.js",
    typescript = "tsc INPUT.ts",                     -- Compilado y ejecutado directamente
    sass = "sass INPUT OUTPUT.css",                  -- Compilado y ejecutado directamente
    cpp = is_windows and "OUTPUT.exe" or "./OUTPUT", -- Ejecutable después de compilar
    c = is_windows and "OUTPUT.exe" or "./OUTPUT",   -- Ejecutable después de compilar
    go = is_windows and "OUTPUT.exe" or "./OUTPUT",  -- Ejecutable después de compilar
    java = "java OUTPUT"                             -- Ejecuta el archivo compilado
}


-- Auxiliary functions
run_code.run_terminal = function(command)
    vim.cmd("vnew")
    vim.cmd("terminal " .. command)
    vim.api.nvim_feedkeys('i', 'n', false)
end

run_code.compile_code = function(command)
    local compileResult = os.execute(command)
    if compileResult ~= 0 then
        notification("An error occurred, your code could not be compiled.", "error")
        return false
    end
    notification("Your code has been successfully compiled", "info")
    return true
end

run_code.validate_extension = function(filename, extension)
    return filename:sub(- #extension) == extension
end

run_code.new_command = function(input, output, command)
    command = string.gsub(command, "INPUT", input)
    return string.gsub(command, "OUTPUT", output)
end

run_code.clean_file = function(filename, extension)
    return filename:sub(1, -(#extension + 1))
end

--- Generic function to run/compile code for any language
--- @param lang string The programming language key (e.g., 'python', 'cpp')
--- @param extension string The file extension for validation
run_code.run_code_generic = function(lang, extension)
    local currentFile = vim.api.nvim_buf_get_name(0)
    if not run_code.validate_extension(currentFile, extension) then
        notification("Invalid file", "error")
        return
    end

    local outputFile = run_code.clean_file(currentFile, extension)
    local command_compile = run_code.compilers_executables[lang]
    local command_exec = run_code.exec_commands[lang]

    if command_compile then
        local compile_cmd = run_code.new_command(currentFile, outputFile, command_compile)
        if not run_code.compile_code(compile_cmd) then return end
    end

    if lang == "java" then
        outputFile = outputFile:match("([^/\\]+)$") -- Obtiene solo el nombre del archivo sin el directorio
    end

    if command_exec then
        local exec_cmd = run_code.new_command(outputFile, outputFile, command_exec)
        run_code.run_terminal(exec_cmd)
    end
end

-- Specialized run functions for each language
run_code.run_python = function() run_code.run_code_generic("python", ".py") end
run_code.run_javascript = function() run_code.run_code_generic("javascript", ".js") end
run_code.run_typescript = function() run_code.run_code_generic("typescript", ".ts") end
run_code.run_cpp = function() run_code.run_code_generic("cpp", ".cpp") end
run_code.run_c = function() run_code.run_code_generic("c", ".c") end
run_code.run_go = function() run_code.run_code_generic("go", ".go") end
run_code.run_scss = function() run_code.run_code_generic("sass", ".scss") end
run_code.run_java = function() run_code.run_code_generic("java", ".java") end

run_code.open_html = function()
    local command = ""
    local extension = ".html"
    local currentFile = vim.fn.expand('%:p')

    if not run_code.validate_extension(currentFile, extension) then
        notification("Invalid file", "error")
        return
    end

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

    vim.fn.jobstart(command .. " " .. currentFile, { detach = true })
    notification("HTML file opened correctly.", "info")
end

_G.RUN_CODE = run_code

-- Assign the commands to be executed by the compilers
vim.cmd([[command! RunPython lua RUN_CODE.run_python()]])
vim.cmd([[command! RunJavascript lua RUN_CODE.run_javascript()]])
vim.cmd([[command! RunTypescript lua RUN_CODE.run_typescript()]])
vim.cmd([[command! RunCPP lua RUN_CODE.run_cpp()]])
vim.cmd([[command! RunC lua RUN_CODE.run_c()]])
vim.cmd([[command! RunGo lua RUN_CODE.run_go()]])
vim.cmd([[command! RunScss lua RUN_CODE.run_scss()]])
vim.cmd([[command! RunJava lua RUN_CODE.run_java()]])
vim.cmd([[command! OpenHTML lua RUN_CODE.open_html()]])
