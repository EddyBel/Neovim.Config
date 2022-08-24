let sistem = "windows" "Define el sistema donde estas.

"Segun sea el sistema define una ruta base
if sistem == "windows"

  let path = "~/AppData/Local/nvim/vim_files/" "Ruta en windows

elseif sistem == "linux"

  let path = "~/.config/nvim/vim_files/" "Ruta en linux

else

  let path = "~/AppData/Local/nvim/vim_files/" "Ruta por defecto

endif

"Lista de archivos a importar
let files = ["settings.vim", "pluggeds.vim", "map.vim", "themes.vim", "pluggeds.config.lua", "pluggeds.config.vim"]

for file in files "Recorre la lista de archivos

  "Crea el comando para importar el archivo
   exec "source" . path . file

endfor
