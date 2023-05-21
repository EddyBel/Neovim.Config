---
-- Validates the type of code formatting and performs the corresponding action.
--
-- This function checks the current file type and performs the corresponding code formatting action.
-- If the file type is in the `filetypes` list (e.g., `lua`, `vim`, `vimscript`), the LSP is used to format the code using `vim.lsp.buf.format()`.
-- Otherwise, the `:Neoformat` command is executed to format the code using the Neoformat plugin.
--
-- Usage example:
-- validates_the_code_formatting_type().
-- Validates the code formatting type and performs the corresponding action.
---
function validates_the_code_formatting_type()
    local filetypes = { "lua", "vim", "vimscript" }
    local is_filetype_special = vim.tbl_contains(filetypes, vim.bo.filetype)

    if is_filetype_special then
        vim.lsp.buf.format()
    else
        vim.cmd(":Neoformat")
    end
end

---
-- Displays a notification or prints a message on the console.
--
-- This function displays a notification using the Notify plugin if available. If Notify is not installed or an error occurs when loading it, the message will be printed to the console.
--
-- @param message (string) The notification message or message to print to the console.
-- @param type (string) [Optional] The type of the notification. It can be "info", "warning" or "error". If not provided, the "info" type will be used.
--
-- Usage example:
-- notification("Process completed", "info").
-- Displays a notification with the message "Process completed" and type "info".
--
-- notification("Error while processing data", "error")
-- Displays a notification with the message "Error processing data" and type "error".
--
-- notification("Warning message", "warning")
-- Displays a notification with the message "Warning message" and type "warning".
--
-- notification("Test message")
-- Displays a notification with the message "Test message" and type "info" by default.
---
function notification(message, type)
    local ok, notify = pcall(require, "notify")
    if ok then
        notify(message, type)
    else
        print(message)
    end
end

---
-- Toggles the comment on the current line.
--
-- This function toggles the comment status of the current line using the `:CommentToggle` command. If the line is empty, it adds an "s" character to the beginning of the line before executing the command to avoid errors. Then, if the line is not empty, simply execute the `:CommentToggle` command.
--
-- Usage example:
-- toggle_comment()
-- Toggles the comment status of the current line.
---
function toggle_comment()
    -- Obtener la información de la línea actual
    local line = vim.api.nvim_get_current_line()
    -- Si la línea está vacía
    if line == "" then
        -- Escribir la letra s
        vim.api.nvim_set_current_line("s")
        -- Ejecutar el comando :CommentToggle
        vim.cmd("CommentToggle")
        -- Ir al final de la línea y borrar el último carácter
        vim.cmd("normal! $x")
    else
        -- Si la línea tiene algo, solo ejecutar el comando :CommentToggle
        vim.cmd("CommentToggle")
    end
end
