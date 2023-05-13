-- ----------------> Configuraciones nativas <----------------

vim.opt.number = true                                 -- Activa los números de línea
vim.opt.mouse = "a"                                   -- Habilita el uso del ratón en todos los modos
vim.opt.showcmd = true                                -- Muestra los comandos parciales en la última línea
vim.opt.encoding = "utf-8"                            -- Establece la codificación de caracteres a UTF-8
vim.opt.showmatch = true                              -- Resalta el paréntesis que corresponde al que está bajo el cursor
vim.opt.autoindent = true                             -- Indenta automáticamente las nuevas líneas según la anterior
vim.opt.splitbelow = true                             -- Abre las ventanas horizontales debajo de la actual
vim.opt.splitright = true                             -- Abre las ventanas verticales a la derecha de la actual
vim.opt.laststatus = 2                                -- Muestra la barra de estado en todas las ventanas
vim.opt.showmode = false                              -- Oculta el modo actual en la última línea
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' } -- Establece que lo que se copie vaya al portapapeles
vim.opt.fillchars = { eob = ' ' }                     -- Limpia los simbolos ~ del editor
vim.o.termguicolors = true                            -- Configuracion que mejora los colores y diseños
vim.opt.wrap = false                                  -- No ajustar al tamaño del monitor
-- vim.opt.relativenumber = true                         -- Activa los números de línea relativos al cursor


-- Formatear automáticamente al guardar :w
vim.cmd([[ autocmd BufWritePre * lua validates_the_code_formatting_type() ]])

-- ----------------> Configuraciones de la tabulacion y espacios <----------------
vim.opt.expandtab = true -- Usa espacios en vez de tabs
-- Configura la cantidad de espacios que utilizara al precionar tab
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.history = 1000 -- Marca el tamaño de historial que tendra
-- vim.opt.t_ut = '' -- En caso de fallos con el fondo


-- Gestor de archivos NERD
-- vim.g.NERDTreeQuitOnOpen = 1

-- ----------------> Configuraciones del tema del editor <----------------
-- Define el tema a utilizar en el editor
vim.cmd("colorscheme kanagawa-wave")
