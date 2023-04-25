:: Instalación de Neovim para windows

:: Comprueba que chocolatey esta instalado
:: Si no esta instalado lo instalas
@echo off
choco -? >nul 2>&1
if errorlevel 1 (
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) else (
    echo Chocolatey ya está instalado
)

@REM Instala Neovim
choco install neovim

:: Crear la carpeta nvim si no existe
if not exist "%LOCALAPPDATA%\nvim\" (
    mkdir "%LOCALAPPDATA%\nvim\"
)

:: Copiar la carpeta lua y el archivo init.lua a la carpeta nvim
xcopy /s /y "%~dp0\lua\" "%LOCALAPPDATA%\nvim\lua\"
copy /y "%~dp0\init.lua" "%LOCALAPPDATA%\nvim\"

:: Importar el script servers.bat
call "%~dp0..\scripts\windows\servers.bat"

echo Instalación completada.