<h1 align="center" >Neovim.Config</h1>

<p align="center">IDE configuration for Neovim</p>

<p align="center">
 <img alt="banner_01" src="https://img.shields.io/github/last-commit/EddyBel/Neovim.Config?color=%23AED6F1&style=for-the-badge" />
 <img alt="banner_02" src="https://img.shields.io/github/license/EddyBel/Neovim.Config?color=%23EAECEE&style=for-the-badge" />
 <img alt="banner_03" src="https://img.shields.io/github/languages/top/EddyBel/Neovim.Config?color=%23F9E79F&style=for-the-badge" />
 <img alt="banner_04" src="https://img.shields.io/github/languages/count/EddyBel/Neovim.Config?color=%23ABEBC6&style=for-the-badge" />
 <img alt="banner_05" src="https://img.shields.io/github/languages/code-size/EddyBel/Neovim.Config?color=%23F1948A&style=for-the-badge" />
</p>

<p align= "center">
    <img src="./assets/Preview.png" />
</p>

This repository contains my custom configuration for Neovim, an advanced text editor that can be turned into a powerful integrated development environment (IDE). With my configuration, Neovim becomes a virtually full-featured IDE, supporting multiple programming languages and offering a smooth and agile user experience thanks to the use of the **[Lazy](https://github.com/folke/lazy.nvim)** plugin manager. You'll find everything you need to start working with Neovim right away, from installing plugins to customizing keyboard shortcuts and display options - enjoy the productivity Neovim has to offer!.

## 😸 Why ?

This repository was created to share my custom configuration of Neovim, an advanced text editor that I have used for a long time for my daily programming work. I have spent many hours customizing and refining my configuration to make Neovim perfectly suited to my needs, and I think other programmers could benefit from it.

## 🔨 Requirements

In order to be able to use the code editor correctly, it is necessary to have some programs previously installed.

- [Neovim >= 0.5.0](https://github.com/neovim/neovim)
- [NerdFonts (Recommended source: FiraCode Nerd Font)](https://www.nerdfonts.com/)
- [NodeJS](https://nodejs.org/en/)
- [Python](https://www.python.org/)
- [Go](https://go.dev/)
- [Rust](https://www.rust-lang.org/)
- [C++](./docs/Instalar%20compilador%20de%20C%2B%2B.md)

## 🦉 Features

- [x] Support for multiple programming languages (Syntax coloring, Code auto-completion, Snippets)
- [x] Commands to quickly execute and compile code.
- [x] Visually pleasing and developer friendly interface.
- [x] Useful information for the status bar.
- [x] Convenient keyboard shortcuts based on the standard of other IDEs like VSCode.

## 🔬 Supported languages

- `javascript` - tsserver
- `typescript` - tsserver
- `javascript react` - tsserver
- `typescript react` - tsserver
- `python` - pyright
- `json` - jsonls
- `css` - cssls
- `sass` - cssls
- `scss` - cssls
- `less` - cssls
- `html` - html - emmet_ls
- `go` - gopls
- `rust` - rust_analyzer
- `bash` - bashls
- `vimscript` - vimls
- `lua` - lua_ls
- `java` - jdtls
- `C` - clangd
- `C++` - clangd
- `Objective C` - clangd
- `C#` - csharp_ls
- `Dockerfile` - dockerls
- `Docker-Compose` - docker_compose_language_service
- `SQL` - sqlls
- `MYSQL` - sqlls

### ⚙ LSP configuration

LSP clients are automatically installed at startup of neovim, this makes the installation work easier but you may not need all the languages, you can modify the `ensure_installed` line of the [mason.lua](./lua/plugins/mason.lua) file, delete or comment out the clients you do not need.

You can also change, add or remove LSP clients for each language, the settings for this can be found in the [lsp.lua](./lua/plugins/lsp.lua) file and can be guided in the settings of the [lsp-config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) plugin. You can also install the clients with the [Mason](https://github.com/williamboman/mason.nvim) plugin, you can use the `:Mason` command or add it to the `ensure_installed` line in [mason.lua](./lua/plugins/mason.lua).

## 🛠 Configurations

The editor has some settings that can be useful and quick to configure, these are found in the [globals.lua](./lua/globals.lua) file, and are global variables that are used throughout the deeper configuration of the plugins.

| VARIABLE              | TYPE    | FUNCTION                                                                                                                                                                                                                                                       |
| --------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| COLOR_THEME           | String  | This variable stores the name of the theme to be used in the editor.                                                                                                                                                                                           |
| COLOR_THEME_STATUSBAR | String  | This variable stores the name of the topic to be used in the status bar (lualine).                                                                                                                                                                             |
| ALPHA                 | String  | This variable stores the ASCII drawing that is displayed when the editor is opened. There are already drawings loaded in the configuration in the [drawings.lua](./lua/utils/drawings.lua) file, you just need to import the drawing you like or add your own. |
| COLOR_LINE            | Table   | This variable stores a color table to use when highlighting the cursor line.                                                                                                                                                                                   |
| TODO_PATTERN          | String  | This variable stores the search pattern to search for TODO comments in the code.                                                                                                                                                                               |
| TODO_ICONS            | Table   | This variable indicates the table of icons to represent each TODO comment.                                                                                                                                                                                     |
| COMPILERS_EXECUTABLES | Table   | This variable stores a table with the structure of how a script should be written to execute a code.                                                                                                                                                           |
| ICONS                 | Table   | This variable stores a table of most of the icons found throughout the editor for general use.                                                                                                                                                                 |
| GIT_SYMBOLS           | Table   | This variable stores a table with the icons or symbols that you will use to identify changes in a git repository.                                                                                                                                              |
| TREE_SYMBOLS          | Table   | This variable stores a table with the icons to be used by the Neotree file manager.                                                                                                                                                                            |
| TREE_WIDTH            | Integer | This variable stores the width of the file manager.                                                                                                                                                                                                            |
| TREE_DIRECTION        | String  | This variable stores from which point the file manager will open, left or right.                                                                                                                                                                               |

## 📦 Additional functions

The editor has some additional commands for different proportions, here is a list of the available commands.

| COMMAND                      | FUNCTION                                                                                                                                        |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `:InitPrettierConfig`        | The command creates a `.pretierrc` file in your project's root path.                                                                            |
| `:InitEditorConfig`          | The command creates a `.editorconfig` file in your project root path                                                                            |
| `:InitDockerfile`            | The command creates a `dockerfile` file in your project root path                                                                               |
| `:InitDockerCompose`         | The command creates a `docker-compose.yaml` file in your project root path                                                                      |
| `:InitSassEstructure <path>` | The command creates a default file structure for sass, the command receives as a parameter the path where the folders are to be created         |
| `:InitNodeEstructure <path>` | The command creates a default file structure for node project, the command receives as a parameter the path where the folders are to be created |
| `:RunPython`                 | The command executes the python file at the side of the editor.                                                                                 |
| `:RunJavaScript`             | The command executes the javascript file at the side of the editor                                                                              |
| `:RunTypeScript`             | The command compiles the typescript file, and then executes the resulting javascript file next to the editor.                                   |
| `:RunScss`                   | The command compiles the current scss file                                                                                                      |
| `:RunGo`                     | The command compiles the open go file and then executes the resulting binary at the side of the editor.                                         |
| `:RunCPP`                    | The command compiles the open c++ file and then executes the resulting binary at the side of the editor.                                        |
| `:RunC`                      | The command compiles the open c file and then executes the resulting binary at the side of the editor.                                          |

## 🧪 How to install

Once you have fulfilled the necessary requirements for the correct functioning of the configuration, you can proceed to the installation of this configuration.

1. The first thing is to clone the configuration repository this can be done with git or download it directly from github. to clone it with git you can use this command:

   ```bash
   git clone https://github.com/EddyBel/Neovim.Config.git
   ```

2. Next is to move to the cloned repository folder once there you must copy the files `init.lua`, `lazy-lock.json` and finally the `lua` folder, these must go in your neovim configuration folder, for Linux systems you can use `~/.config/nvim`, for Windows you can use `C:\Users\Username\AppData\Local\nvim` or wherever neovim defines the configuration path.

   _Linux_

   ```bash
   cd Neovim.Config
   cp init.lua lazy-lock.json lua ~/.config/nvim
   ```

   _Windows_

   ```sh
   cd Neovim.Config
   xcopy init.lua lazy-lock.json lua C:\Users\Username\AppData\Local\nvim /s /e /i
   ```

3. Before opening neovim it is important to install the code formatters, these will allow your code to maintain a good structure and design, for this we use the [Neoformat](https://github.com/sbdchd/neoformat) plugin to manage the formatters but we must install them separately with the following commands:

   ##### [Prettier](https://prettier.io/)

   ```bash
   npm install -g prettier
   ```

   ##### [Black](https://pypi.org/project/black/)

   ```bash
   pip install black
   ```

   ##### [Clang-format](https://pypi.org/project/clang-format/)

   ```bash
   pip install clang-format
   ```

4. Finally you can open the editor with the command `nvim` and lazy will install all the plugins automatically, and that's it! you can start coding.

## 🎢 Project status

The project is constantly changing because it is my usual code editor and I will be improving and adding things as I see fit.

## 📑 LICENCE

This project is released under the terms of the MIT license. The MIT license allows users to use, copy, modify and distribute the source code of the project with certain restrictions and requirements. For more information on the terms and conditions of the MIT license, please refer to the license file included with this project or visit https://opensource.org/licenses/MIT.

---

<p align="center">
  <a href="https://github.com/EddyBel" target="_blank">
    <img alt="Github" src="https://img.shields.io/badge/GitHub-%2312100E.svg?&style=for-the-badge&logo=Github&logoColor=white" />
  </a> 
  <a href="https://www.linkedin.com/in/eduardo-rangel-eddybel/" target="_blank">
    <img alt="LinkedIn" src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />
  </a> 
</p>
