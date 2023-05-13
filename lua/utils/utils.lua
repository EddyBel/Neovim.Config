---Antes de formatear valida el tipo de archivo
---Si se encuentra en un archivo lua o vim usa el formateador nativo
---Si no utilzia el plugin Neoformat
function validates_the_code_formatting_type()
  local filetypes = { "lua", "vim", "vimscript" }
  local is_filetype_special = vim.tbl_contains(filetypes, vim.bo.filetype)

  if is_filetype_special then
    vim.lsp.buf.format()
  else
    vim.cmd(":Neoformat")
  end
end

---Lanza una notificación si se encuentra el modulo de notify
function notification(message, type)
  local ok, notify = pcall(require, "notify")
  if ok then
    notify(message, type)
  else
    print(message)
  end
end
