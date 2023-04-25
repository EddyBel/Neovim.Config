#!/bin/bash

# Verificar si curl está instalado
if ! [ -x "$(command -v curl)" ]; then
  echo "curl no está instalado. Instalando..."
  sudo apt update
  sudo apt upgrade
  sudo apt install -y curl
else
  echo "curl ya está instalado."
fi

# Verificar si Neovim está instalado
if ! [ -x "$(command -v nvim)" ]; then
    echo "Neovim no está instalado. Instalando..."
    if [ -x "$(command -v curl)" ]; then
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    else
        echo "No se puede descargar Neovim porque curl no está instalado."
        exit 1
    fi
    chmod u+x nvim.appimage
    ./nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version

    # Optional: exposing nvim globally.
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
else
    echo "Neovim ya está instalado."
fi

# Copiar la carpeta lua y el archivo init.lua a la carpeta de configuración de Neovim
echo "Copiando la carpeta lua y el archivo init.lua a la carpeta de configuración de Neovim..."
mkdir -p ~/.config/nvim/
cp -r ./lua ~/.config/nvim/
cp ./init.lua ~/.config/nvim/
echo "Se han copiado la carpeta lua y el archivo init.lua a la carpeta de configuración de Neovim."

# Instala todos los servidores
source "./scripts/linux/servers.sh"
