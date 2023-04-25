<h1 align="center" >LISTA DE PLUGINS</h1>

## ÍNDICE

- [Autocompletado](#AUTOCOMPLETADO)
- [Gestor de archivos](#GESTORES-DE-ARCHIVOS)
- [Herramientas](#HERRAMIENTAS)
- [Diseño](#DISEÑO)
- [Temas](#TEMAS)

---

# AUTOCOMPLETADO

### [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Este plugin proporciona una herramienta de búsqueda y selección de archivos, buffers, commits y otros elementos dentro del editor.

Este es un plugin de Neovim que proporciona un resaltado de sintaxis avanzado utilizando un análisis sintáctico basado en árboles de sintaxis abstracta.

La configuración proporcionada establece las opciones de resaltado y arcoiris, permitiendo la habilitación o deshabilitación de cada uno de ellos y especificando detalles como los colores utilizados. También se pueden configurar opciones como la instalación automática de los parsers de treesitter para diferentes lenguajes de programación y la capacidad de deshabilitar el resaltado para lenguajes específicos o archivos grandes.

### [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Este plugin configura y activa una serie de servidores LSP (Language Server Protocol) para diferentes lenguajes de programación. También habilita la funcionalidad de snippet para autocompletado, establece opciones de configuración para cada servidor y crea mapeos de teclas para la navegación y corrección de errores en el código. Además, configura la visualización de mensajes de diagnóstico y utiliza autocomandos para habilitar los mapeos de teclas solo después de que el servidor LSP se haya conectado al buffer actual.

### [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

Este es un plugin para Neovim llamado "nvim-lsp-installer". Su función principal es instalar y configurar automáticamente los servidores LSP (Language Server Protocol) necesarios para utilizar el soporte LSP en Neovim.

Algunas de sus características son:

- Detecta automáticamente qué servidores instalar, basándose en los servidores que están configurados mediante "lspconfig".
- Proporciona una interfaz de usuario visual para mostrar el estado de la instalación de los servidores LSP, mediante la utilización de iconos.
- Es altamente configurable mediante sus opciones, permitiendo al usuario personalizar varios aspectos del plugin, como la - ubicación de instalación de los servidores, la forma en que se muestran los iconos de estado, entre otros.

### [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Es un complemento de autocompletado para Neovim. El complemento "nvim-cmp" tiene varias dependencias, que son bibliotecas adicionales que se necesitan para su funcionamiento. Estas bibliotecas incluyen "cmp-buffer", "cmp-path", "cmp-nvim-lua", "cmp-nvim-lsp", "cmp-cmdline", "cmp-git", "cmp_luasnip" y "nvim-autopairs".

La configuración también importa otras bibliotecas necesarias, como "lspkind" para formatear la información de autocompletado, "luasnip" para el soporte de snippets y "nvim-autopairs" para la inserción automática de pares de caracteres.

La configuración define los atajos de teclado para controlar el menú de autocompletado y configura las fuentes que utilizará para mostrar información del autocompletado. También se configura la inserción automática de pares de caracteres para la tecla "Tab".

# GESTORES DE ARCHIVOS

### [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

En la configuración se establecen opciones predeterminadas para el comportamiento de Telescope, como los argumentos utilizados para la búsqueda con "rg", el prefijo de búsqueda, la estrategia de selección, el estilo de ordenamiento, entre otros.

También se establecen opciones específicas para los diferentes tipos de selecciones (por ejemplo, el picker "find_files" tiene un tema específico establecido). Además, se definen extensiones adicionales para el plugin, como la capacidad de buscar archivos multimedia (imágenes) con el comando "rg".

### [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)

El plugin de neovim "nvim-neo-tree/neo-tree.nvim" proporciona una forma fácil de navegar por el sistema de archivos de su computadora en la ventana lateral de neovim, lo que puede ser especialmente útil si trabaja con varios archivos en un proyecto grande.

Algunas de las características notables del plugin incluyen:

- Integración de Git: muestra el estado de Git (añadido, modificado, eliminado, etc.) para archivos y carpetas.
- Integración con LSP: muestra errores y advertencias de LSP en archivos.
- Soporte para iconos: muestra iconos para diferentes tipos de archivos y carpetas.
- Personalización: muchas opciones de personalización, desde la apariencia de los iconos hasta los atajos de teclado para usar el plugin.
  En general, el plugin de neovim "nvim-neo-tree/neo-tree.nvim" es una herramienta útil para mejorar la eficiencia al trabajar con proyectos grandes en neovim.

# HERRAMIENTAS

### [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)

Este plugin permite comentar y descomentar código en diferentes lenguajes de programación de forma rápida y sencilla. Las características de esta configuración incluyen opciones para agregar espacios entre los marcadores de comentario, comentar líneas vacías o solo con espacios en blanco, recortar espacios en blanco de los comentarios vacíos, crear asignaciones de teclas para comentar y descomentar, y definir un hook (gancho) personalizado que se llama antes de realizar el comentario.

### [ziontee113/color-picker.nvim](https://github.com/ziontee113/color-picker.nvim)

Este plugin permite seleccionar colores en el editor de texto mediante una interfaz gráfica y su correspondiente código hexadecimal se inserta automáticamente en el archivo.

La opción "keys" especifica que al presionar Ctrl+c en modo insertar, se llamará al comando "PickColorInsert", que abrirá la interfaz gráfica para seleccionar un color y lo insertará en la posición del cursor.

### [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Este es un plugin de Neovim llamado "nvim-autopairs" permite la inserción automática de pares de caracteres como paréntesis, corchetes y comillas en el código. También puede eliminar automáticamente los pares de caracteres correspondientes si se elimina uno de ellos.

# DISEÑO

### [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

Este es un plugin llamado "nvim-notify" que proporciona una función de notificación en Neovim. La función de notificación sobrescribe la función nativa de notificación de Vim y permite mostrar notificaciones en la esquina superior derecha de la ventana de Neovim. El código de configuración establece el fondo de las notificaciones como negro y las configura para que se desvanezcan.

### [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Este es un plugin para Neovim llamado "lualine.nvim" que proporciona una barra de estado personalizable. Permite mostrar información útil como el modo de edición actual, el nombre del archivo, el tipo de archivo, la ubicación, los errores de diagnóstico, entre otros.

Las características de este plugin incluyen:

- Configuración personalizada de la barra de estado a través de opciones y secciones predefinidas.
- Soporte para íconos y separadores personalizados.
- La capacidad de actualizar la barra de estado en intervalos regulares.
- Incluye integración con el plugin "nvim-web-devicons" para mostrar íconos en la barra de estado.
- Para utilizar este plugin, primero debe instalarse y agregarse a la lista de plugins de Neovim. Luego, puede personalizar la apariencia de la barra de estado a través de las opciones y secciones proporcionadas en la configuración del plugin.

### [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

Este es un plugin llamado nvim-colorizer.lua para Neovim, el cual tiene la función de resaltar los códigos de colores en los archivos de código para mejorar su visualización y comprensión. Por ejemplo, si se tiene una cadena de texto que representa un color en hexadecimal (como "#FF0000" para el rojo), este plugin lo resaltará con el color correspondiente en lugar de simplemente mostrar el código.

### [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

El objetivo de este plugin es mostrar las líneas en blanco de forma visual en la pantalla, lo que puede ayudar a visualizar la estructura del código.

El código proporcionado utiliza este plugin y proporciona algunas opciones de configuración. En el bloque "init", se establece la opción "list" en verdadero, lo que hace que se muestren caracteres especiales para los espacios en blanco y los finales de línea en el archivo. Luego, en el bloque "opts", se establecen algunas opciones específicas de este plugin. "space_char_blankline" establece el carácter que se utilizará para representar los espacios en blanco en las líneas en blanco. "show_current_context" y "show_current_context_start" son opciones que muestran una línea vertical para indicar el contexto actual del código.

En general, este plugin puede ser útil para aquellos que deseen visualizar claramente la estructura de su código y mantener una presentación uniforme del mismo.

### [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)

Es una extensión para Neovim que reemplaza la barra de pestañas predeterminada por una barra de pestañas más personalizable y fácil de usar. Esta barra de pestañas se llama "barbar" y permite que el usuario pueda moverse fácilmente entre diferentes pestañas en el editor.

En el código proporcionado, se puede ver que el plugin depende de otro plugin llamado "nvim-web-devicons", que proporciona iconos para cada pestaña en la barra de pestañas. Además, hay una línea de código comentada que deshabilita la configuración automática del plugin, lo que significa que el usuario deberá configurar manualmente la apariencia de la barra de pestañas.

En general, "barbar.nvim" es una excelente opción para aquellos que buscan una experiencia de usuario más personalizable y fácil de usar en Neovim.

# TEMAS

### [rose-pine/neovim](https://github.com/rose-pine/neovim)

### [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

### [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)

### [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)

### [catppuccin/nvim](https://github.com/catppuccin/nvim)
