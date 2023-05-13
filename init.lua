vim.g.mapleader = " "      -- Define la tecla leader de neovim
vim.o.termguicolors = true -- Habilita el uso de colores en la terminal

-- Concatena la ruta a la carpeta "lazy" dentro de la carpeta "data" de neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Si no existe la carpeta "lazy" en la ruta anterior, clona el repositorio de "lazy.nvim" dentro de ella
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Agrega la ruta de "lazy.nvim" al inicio de las rutas de plugins de neovim
vim.opt.rtp:prepend(lazypath)

-- Carga el módulo "lazy" y le pasa la cadena "plugins" como argumento para configurar los plugins
local lazy = require("lazy")
lazy.setup("plugins")

-- Carga los módulos o archivos necesarios para la configuración
require("map")
require("utils.files")
require("utils.utils")
require("settings")
