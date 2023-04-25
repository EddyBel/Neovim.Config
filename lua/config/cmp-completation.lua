local cmp = require "cmp"                                     -- Importa la biblioteca de autocompletado "cmp"
local lspkind = require "lspkind"                             -- Importa la biblioteca "lspkind" para formatear la información del autocompletado
local luasnip = require "luasnip"                             -- Importa la biblioteca "luasnip" para el soporte de snippets
local cmp_autopairs = require "nvim-autopairs.completion.cmp" -- Importa la biblioteca "nvim-autopairs" para la inserción automática de pares de caracteres
local compare = require "cmp.config.compare"                  -- Importa la biblioteca "cmp.config.compare" para la comparación de los elementos del autocompletado

-- Configura la inserción automática de pares de caracteres para la tecla "Tab"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

cmp.setup {
  -- Define donde iniciara la seleccion por defecto
  initial_select = cmp.SelectFirst,

  -- Configura las teclas que se utilizaran para manejar el menu
  -- Ctrl + d Desplaza hacia arriba los documentos de la ayuda
  -- Ctrl + d Desplaza hacia abajo los documentos de la ayuda
  -- Tab Recorre las opciones hacia abajo
  -- Shift + Tab Recorre las opciones hacia arriba
  -- Ctrl + p para seleccionar el elemento anterior en la lista del autocompletado
  -- Enter para confirmar la selección del autocompletado
  -- Ctrl + space para completar el autocompletado
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          fallback()
        end
      end, { "i", "s" }),
    ["<S-TAB>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.close()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<Enter>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<C-Space>"] = cmp.mapping.complete(),
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
    { name = "nvim_lsp_signature_help" },
    { name = "emmet_vim" },
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
    },
  },

  -- La sección snippet define una función anónima expand que se utilizará para expandir los snippets. Dentro de la función, se llama a la función lsp_expand de la biblioteca luasnip
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        ["vim-dadbod-completion"] = "[DB]",
      },
    },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.kind,
      compare.sort_text,
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = false,
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
  sources = cmp.config.sources({
    { name = "vim-dadbod-completion" },
  }, {
    { name = "buffer" },
  }),
})
