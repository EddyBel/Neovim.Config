local cmp_utils = {}

local cmp = require("cmp")
local luasnip = require("luasnip")

---Desplaza hacia arriba en un menú desplegable, o selecciona la opción siguiente en un autocompletado.
---Si un menú desplegable está visible, selecciona la opción anterior.
---Si un autocompletado está activo, selecciona la opción siguiente.
---Si no hay ni menú desplegable ni autocompletado activo, llama a la función de fallback.
---@param fallback La función que se llama si no hay ni menú desplegable ni autocompletado activo.
cmp_utils.go_up_in_menu = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.choice_active() then
    luasnip.change_choice(1)
  else
    fallback()
  end
end

---Desplaza hacia abajo en un menú desplegable, o selecciona la opción anterior en un autocompletado.
---Si un menú desplegable está visible, selecciona la opción siguiente.
---Si un autocompletado está activo, selecciona la opción anterior.
---Si no hay ni menú desplegable ni autocompletado activo, llama a la función de fallback.
---@param fallback La función que se llama si no hay ni menú desplegable ni autocompletado activo.
cmp_utils.go_down_in_menu = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

---Cierra un menú desplegable, o expande o salta a un fragmento de código en un autocompletado.
---Si un menú desplegable está visible, lo cierra.
---Si un autocompletado está activo y el fragmento actual tiene campos vacíos, los completa.
---Si un autocompletado está activo y el fragmento actual no tiene campos vacíos, salta al siguiente campo.
---Si no hay ni menú desplegable ni autocompletado activo, llama a la función de fallback.
---@param fallback La función que se llama si no hay ni menú desplegable ni autocompletado activo.
cmp_utils.go_close_menu = function(fallback)
  if cmp.visible() then
    cmp.close()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end

return cmp_utils
