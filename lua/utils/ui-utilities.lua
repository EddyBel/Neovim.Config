local M = {}

---This is a table that contains the borders used in the application.
---The borders are used to display the information in the application.
---The borders are represented by a table that contains the characters used to draw the borders.
M.BORDERS_LIST = {
    default = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Diseño estándar
    classic = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Diseño clásico
    japan = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" }, -- Diseño japonés
    notebook = { "╓", "─", "╖", "│", "╜", "─", "╙", "│" }, -- Diseño de cuaderno
    box = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Diseño de caja simple
    window = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }, -- Diseño de ventana
    notes = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Diseño de cuaderno de notas
    solid = { "▒", "▒", "▒", "▒", "▒", "▒", "▒", "▒" }, -- Diseño sólido
    fill = { "░", "░", "░", "░", "░", "░", "░", "░" }, -- Diseño de relleno
    modern = { "⎧", "⎯", "⎫", "⎪", "⎭", "⎯", "⎩", "⎪" }, -- Diseño moderno
    braille = { "⠿", "⠿", "⠿", "⠿", "⠿", "⠿", "⠿", "⠿" }, -- Diseño Braille
    braille_v2 = { "⠖", "⠒", "⠲", "⢸", "⠴", "⠤", "⠦", "⡇" }, -- Diseño Braille version 2
    cyber = { "╔", "═", "╗", "╬", "╝", "═", "╚", "╬" }, -- Diseño personalizado
    pixel = { "▞", "█", "▚", "█", "▞", "█", "▚", "█" }, -- Estilo Pixel
    pixel2 = { "■", "■", "■", "▞", "■", "■", "■", "▚" }, -- Estilo Pixel 2
    minimal = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Diseño minimalista.
}


---This function returns the border based on the name.
---@param name string The name of the border.
---@return table The border table.
M.get_border = function(name) return M.BORDERS_LIST[name] or nil end

return M
