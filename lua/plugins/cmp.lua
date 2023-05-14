return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    'dcampos/cmp-snippy',
    "dcampos/nvim-snippy",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim",
    "windwp/nvim-autopairs",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "honza/vim-snippets",
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    { "L3MON4D3/LuaSnip", version = "v1.*" },
  },
  event = "VeryLazy",
  config = function()
    local cmp = require "cmp"                                     -- Importa la biblioteca de autocompletado "cmp"
    local lspkind = require "lspkind"                             -- Importa la biblioteca "lspkind" para formatear la información del autocompletado
    local cmp_autopairs = require "nvim-autopairs.completion.cmp" -- Importa la biblioteca "nvim-autopairs" para la inserción automática de pares de caracteres
    local compare = require "cmp.config.compare"                  -- Importa la biblioteca "cmp.config.compare" para la comparación de los elementos del autocompletado
    local cmp_utils = require "utils.cmp"                         -- Importa las funciones ya creadas para desplasace en un menu de cmp

    -- Configura la inserción automática de pares de caracteres
    require("nvim-autopairs").setup()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    ---Opciones de diseño de la ventana de cmp
    ---@table WindowOptions
    ---@field border string @ el tipo de borde de la ventana, por defecto es "rounded"
    ---@field winhighlight string @ las opciones de resaltado de la ventana, por defecto es "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None"
    ---@field zindex number @ la posición de la ventana en el orden z, por defecto es 1001
    ---@field scrolloff number @ el desplazamiento vertical que se mantiene fuera de la vista, por defecto es 0
    ---@field col_offset number @ el desplazamiento horizontal de la ventana, por defecto es 0
    ---@field side_padding number @ el espacio de relleno en los lados de la ventana, por defecto es 1
    ---@field scrollbar boolean @ si se muestra una barra de desplazamiento, por defecto es verdadero

    ---@example
    --- Ejemplo de opciones de diseño de ventana:
    --- ```
    --- local window_opts = {
    ---   border = 'solid',
    ---   winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    ---   zindex = 999,
    ---   scrolloff = 5,
    ---   col_offset = 2,
    ---   side_padding = 2,
    ---   scrollbar = false
    --- }
    --- ```
    ui_window = cmp.config.window.bordered()

    cmp.setup {

      -- Diseño de la ventana flotante de cmp
      window = {
        completion = ui_window,
        documentation = ui_window
      },


      -- Define donde iniciara la seleccion por defecto
      initial_select = cmp.SelectFirst,

      -- Configura las teclas que se utilizaran para manejar el menu
      -- Ctrl + d Desplaza hacia arriba 4 elementos los documentos de la ayuda
      -- Ctrl + f Desplaza hacia abajo 4 elementos los documentos de la ayuda
      -- Tab o Down Recorre las opciones hacia abajo
      -- Shift + Tab o Up Recorre las opciones hacia arriba
      -- Enter para confirmar la selección del autocompletado
      -- Ctrl + space para completar el autocompletado

      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<Down>"] = cmp.mapping(cmp_utils.go_up_in_menu, { "i", "s" }),
        ["<Up>"] = cmp.mapping(cmp_utils.go_down_in_menu, { "i", "s" }),
        ["<C-c>"] = cmp.mapping(cmp_utils.go_close_menu, { "i", "s" }),
        ["<Enter>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true, },
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping.complete()
      },

      -- Deifne las fuentes que utilizara para mostrar información del autocompletado.
      -- nvim_lua -> Utiliza la API de Lua de Neovim para autocompletado. Esto permite autocompletar funciones, variables y otros elementos en archivos Lua que estén abiertos en Neovim.
      -- nvim_lsp ->  Utiliza el protocolo LSP (Language Server Protocol) para autocompletar elementos en cualquier idioma que tenga un servidor LSP disponible. Este servidor proporciona información como la documentación y los tipos de los elementos que se autocompletan.
      -- path -> Utiliza los nombres de los archivos y directorios del sistema de archivos como fuentes para autocompletar en los comandos de Neovim que requieren una ruta de archivo.
      -- luasnip -> Utiliza la biblioteca de snippets "luasnip" para proporcionar autocompletado de snippets de código. Estos son fragmentos de código predefinidos que se pueden insertar en un archivo con solo escribir una abreviatura.
      -- nvim_lsp_signature_help -> Utiliza el protocolo LSP para mostrar información de ayuda en la firma de una función o método mientras se está escribiendo en un archivo.
      -- buffer -> Utiliza el contenido del búfer actual para autocompletar. Esta fuente es útil cuando se están trabajando con archivos que no tienen soporte para autocompletado en Neovim, como archivos de configuración o archivos de texto plano.
      sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = 'vsnip' },
        { name = 'snippy' },
        { name = "nvim_lsp_signature_help" },
        {
          name = "buffer",
          keyword_length = 4,
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                local bufnr = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_option(bufnr, 'buftype') ~= 'terminal' then bufs[bufnr] = true end
              end
              return vim.tbl_keys(bufs)
            end,
          },
        }
      },

      ---`formatting` es una tabla que permite personalizar la apariencia de los elementos de autocompletado en `cmp`.
      ---`format` es una función que toma una entrada de autocompletado `cmp.Entry` y un objeto `cmp.VimItem` y devuelve
      ---una cadena que representa cómo se debe mostrar el elemento.
      ---`with_text` es un booleano que indica si se debe mostrar el texto completo de la entrada de autocompletado.
      ---`menu` es una tabla que mapea nombres de origen de autocompletado a etiquetas personalizadas que se
      ---mostrarán en el menú de autocompletado. Los nombres de origen comunes son "nvim_lsp", "buffer", "nvim_lua",
      ---"path", "luasnip" y "vim-dadbod-completion".
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            nvim_lsp = " ",
            buffer = " ",
            nvim_lua = " ",
            path = " ",
            snippy = " ",
            vsnip = " ",
            luasnip = " ",
            ["vim-dadbod-completion"] = " ",
          },
        },
      },


      -- La sección snippet define una función anónima expand que se utilizará para expandir los snippets. Dentro de la función, se llama a la función lsp_expand de la biblioteca luasnip
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
          -- require("snippy").expand_snippet(args.body)
        end,
      },

      ---`sorting` es una tabla que permite personalizar cómo se ordenan las entradas de autocompletado en `cmp`.
      ---`priority_weight` es un número que se utiliza para determinar la importancia relativa de la prioridad de una
      ---entrada de autocompletado. Las entradas de autocompletado con prioridades más altas se colocarán antes que
      ---las entradas con prioridades más bajas.
      ---`comparators` es una tabla de funciones que se utilizan para comparar las entradas de autocompletado.
      ---Las funciones deben tomar dos argumentos `lhs` y `rhs`, que son las dos entradas que se van a comparar, y
      ---deben devolver un valor booleano que indique si `lhs` es mayor que `rhs`. Las funciones se aplican en el
      ---orden en que aparecen en la tabla. En el ejemplo proporcionado, las entradas se ordenan primero por su tipo
      ---(`kind`) y luego por su texto de ordenación (`sort_text`).
      sorting = {
        priority_weight = 2,
        comparators = {
          compare.kind,
          compare.sort_text,
        },
      },

      ---La sección `experimental` es una tabla que permite activar funciones experimentales en `cmp`.
      ---`native_menu` es una opción booleana que permite habilitar la funcionalidad de menú nativo de la
      ---plataforma. Esto puede proporcionar una experiencia de usuario más consistente, pero puede tener
      ---problemas de compatibilidad con algunos entornos. El valor predeterminado es `false`.
      ---`ghost_text` es una opción booleana que permite habilitar el texto fantasma para las entradas de
      ---autocompletado. El valor predeterminado es `false`.
      experimental = {
        native_menu = false,
        ghost_text = false,
      },
    }

    --- Configuración de autocompletado de `gitcommit`
    ---@param ft string El tipo de archivo para el que se va a configurar el autocompletado.
    ---@param opts table Tabla que contiene opciones de configuración para `cmp`.
    ---@field sources table Una tabla de fuentes que se usarán para el autocompletado.
    --- Cada fuente es una tabla que debe incluir al menos un campo `name` con el nombre de la fuente.
    --- Las fuentes se proporcionan en orden de prioridad, y las fuentes más prioritarias se mostrarán primero en
    --- el menú de autocompletado.
    --- El código proporcionado configura `cmp` para el tipo de archivo `gitcommit` con opciones de configuración
    --- específicas. La tabla `sources` se usa para configurar las fuentes de autocompletado que se utilizarán
    --- para este tipo de archivo. En este caso, la fuente `cmp_git` se coloca en primer lugar, seguida de la fuente
    --- `buffer`.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" },
      }, {
        { name = "buffer" },
      }),
    })

    --- Configuración de autocompletado de línea de comandos para la búsqueda en buffer
    ---@param trigger string El carácter que se usará para activar el autocompletado de línea de comandos.
    ---@param opts table Tabla que contiene opciones de configuración para `cmp`.
    ---@field mapping table Una tabla que contiene asignaciones de teclas personalizadas para el autocompletado.
    --- Si no se proporciona, se utilizará la asignación de teclas predeterminada para la línea de comandos.
    ---@field sources table Una tabla de fuentes que se usarán para el autocompletado.
    --- Cada fuente es una tabla que debe incluir al menos un campo `name` con el nombre de la fuente.
    --- Las fuentes se proporcionan en orden de prioridad, y las fuentes más prioritarias se mostrarán primero en
    --- el menú de autocompletado.

    --- El código proporcionado configura `cmp` para la línea de comandos de búsqueda en buffer con opciones de
    --- configuración específicas. El carácter `/` se usa para activar el autocompletado de línea de comandos y la
    --- asignación de teclas predeterminada se utiliza para el autocompletado. La tabla `sources` se usa para
    --- configurar las fuentes de autocompletado que se utilizarán. En este caso, la fuente `buffer` se usa
    --- exclusivamente para la búsqueda en buffer.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    ---Configura la línea de comandos de la extensión `cmp`.
    ---@param prefix El prefijo que se utilizará para invocar la línea de comandos.
    ---@param config Una tabla que contiene la configuración de `cmp` para la línea de comandos.
    ---@field mapping Una tabla que contiene los mapeos de teclas para la línea de comandos.
    ---@field sources Una tabla que contiene las fuentes de datos para la línea de comandos.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })


    ---Configura `cmp` para los tipos de archivo SQL, MySQL y PL/SQL.
    ---@param filetypes Una tabla que contiene los tipos de archivo para los que se configurará `cmp`.
    ---@param config Una tabla que contiene la configuración de `cmp` para los tipos de archivo.
    ---@field sources Una tabla que contiene las fuentes de datos para los tipos de archivo.
    cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
