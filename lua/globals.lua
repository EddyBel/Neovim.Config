local M = {}

---This variable represents the welcome greeting to the editor
M.GRETING_MESSAGE = "✨ Hello! Welcome back 💻"

---This variable defines whether you want a transparent background in the editor.
M.BACKGROUND_TRANSPARENT = false
---This variable defines the theme of the editor.
---1. catppuccin
---2. catppuccin-latte
---3. catppuccin-frappe
---4. catppuccin-macchiato
---5. catppuccin-mocha
---6. kanagawa
---7. kanagawa-wave
---8. kanagawa-lotus
---9. kanagawa-dragon
---10. rose-pine
---11. rose-pine-main
---12. rose-pine-moon
---13. rose-pine-dawn
---14. tokyonight
---15. tokyonight-night
---16. tokyonight-storm
---17. tokyonight-day
---18. tokyonight-moon
---19. gruvbox
---20. everforest
---21. nord
M.THEME = "kanagawa"

-- Configurations for the optimization libreries -------------------------------

---This variable defines the mode of optimization for cleaning buffers.
---1. timer -> It will clean the buffers every X minutes.
---2. limit -> It will clean the buffers when the number of buffers reaches a certain limit.
---3  max -> It will clean the buffers when the number of buffers reaches the maximum limit.
---3  manual -> It will clean the buffers manually.
M.OPTIMIZE_CLEAN_BUFFERS_MODE = "timer"
M.OPTIMIZE_CLEAN_BUFFERS_TIMER = 30 -- min
M.OPTIMIZE_CLEAN_BUFFERS_LIMIT = 100 -- limit of buffers
M.OPTIMIZE_CLEAN_BUFFERS_MAX = 100 -- max limit of buffers

---This variable defines the artificial intelligence assistant for code that will be used by the editor, it has multiple values
-- - Codeium
-- - Supermaven
-- - Copilot
M.COPILOT = "Supermaven"
---This variable indicates whether you want to use the copilot in the code hints.
M.COPILOT_IN_CMP = false
---This variable indicates whether you want to use the copilot in the code hints.
M.COPILOT_IN_LINE = true

---This variable is an object that indicates the properties that the status bar (lualine) can have.
---1. theme -> string
---     This variable stores the name of the theme to be used for the status bar of the lualine plugin.
---     You can learn more about the available themes in the plugin documentation:
---     https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
---2. separator -> table Indicates which will be the separator for each statusbar item.
---3. decorator -> table Indicate which will be the decorative separator for each special section of the statusbar.
---4. type -> string Indicates the distribution of information in the status bar.
---     - completed
---     - completed v2
---     - simple
---     - compact
---Decorations suggestions
--- 
--- 
M.STATUSBAR = {
    theme = 'auto',
    type = "simple",
    separator = {left = '', right = ''},
    decorator = {left = '', right = ''},
    information = {
        lsp_clients_names = false,
        lsp_clients_number = true,
        lsp_formatter = true,
        assistant = true
    }
}

M.FILEBAR = {
    enabled = true,
    divider = "┊",
    indicator = {
        file_modified = "●",
        file_saved = "",
        file_icon_not_found = "󰧮",
        file_name_not_found = "[No Name]",
        buffer_window_index = ""
    }
}

---This variable stores the front drawing ASCII that can be displayed when neovim is started.
---It is imported from the drawing file saved in the neovim configuration.
M.ALPHA = require("utils.drawings").min_hydra

---This variable defines the search pattern to search ALL in the code.
---
---Patterns
---1. [[.*(KEYWORDS).*]] => TODO
---2. [[.*<(KEYWORDS)\s*:]] => <TODO:
---3. [[.*\s(KEYWORDS)\s*]] =>  TODO (TODO with a space before)
---4. [[.*(KEYWORDS)*:]] => TODO:
M.TODO_PATTERN = [[.*(KEYWORDS).*]]

---This object defines the icons that will be used by the comments throughout the code.
---The sings property defines whether to use icons at the side of the comment.
M.TODO_ICONS = {
    signs = true, -- Defines whether icons will be used
    type = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    fix = "",
    todo = "",
    hack = "󰈸",
    warn = "",
    perf = "󰎓",
    note = "",
    test = "󰳪",
    exam = ""
}

---
-- _G.ICONS is a dictionary containing several icons used in some specific context.
-- Each key in the dictionary represents a symbolic name associated with a specific
-- icon and the associated value is the character or set of characters representing
-- that icon.
-- Associated value is the character or set of characters represented by that icon.
---
_G.ICONS = {
    prefix = "", -- Prefix displayed in the virtual text
    error = '', -- Error icon
    warn = '', -- Warning icon
    info = '󰅺', -- Info icon
    hint = '', -- Hint icon
    time = '󱑃', --  Icon representing each operating system
    formatter = "", -- Icon representing code formatter
    lsp = "", -- Icon representing LSP clients
    cmp_machine_learning = "󰫢", -- Icon representing codeium artificial intelligence autocompletion
    cmp_buffer = "", -- Icon representing Buffer suggestions
    cmp_lua = "", -- Icon that represents the suggestions of lua
    cmp_path = "", -- Icon representing route suggestions
    cmp_snippets = "", -- Icon representing snippet suggestions (snippy)
    cmp_vsnip = "󰨞", -- Icon representing vsnip suggestions
    cmp_luasnip = "", -- Icon representing lua snippet suggestions
    cmp_db = "", -- Icon representing database suggestions
    cmp_codeium = "", -- Icon representing codeium artificial intelligence autocompletion
    cmp_supermaven = "", -- Icon que representa a supermaven el asistente de inteligencia artificial
    copilot = {enable = "", disable = "", warning = ""}, -- Icons representing the copilot status
    git = {add = "", removed = "", modified = ""}, -- Icons indicating the status of git changes
    spinner = {
        "⠿", "⠞", "⠇", "⠑", "⠝", "⠞", "⠎", "⠕", "⠍", "⠑",
        "⠋"
    }, -- Icons representing the loading animation
    os = {
        ["Windows"] = "󰍲", -- 󰍲  󰖳  󰨡
        ["Darwin"] = "", --  󰇄
        ["Ubuntu"] = "", --  󰕈  
        ["Kali"] = "", --  
        ["Arch"] = "", --   󰣇
        ["Debian"] = "", -- 󰣚
        ["Fedora"] = "", --  󰣛 󰮤
        ["Parrot"] = "", -- 
        ["Alpine"] = "", -- 
        ["Centos"] = "", --  󱄚
        ["Elementary"] = "", -- 
        ["Gentoo"] = "󰣨", --  󰣨
        ["Manjaro"] = "", --  󱘊
        ["Mint"] = "󰣭", -- 󰣭
        ["Opensuse"] = "", -- 
        ["Raspbian"] = "", --  󰐿
        ["Linux"] = "", -- 󰌽
        ["Default"] = "" --    
    } --  Icons representing each operating system
}

---G.GIT is a dictionary containing different icons used in a context
---related to Git version control. Each key in the dictionary represents
---a symbolic name associated with a specific icon, and the associated
---value is the character representing that icon.
M.GIT_SYMBOLS = {
    add = '│',
    change = '│',
    delete = '',
    topdelete = '󰅃',
    changedelete = '',
    untracked = '┆'
}

---This variabel indicates if you want to show information of the last commit in each line of the editor.
M.GIT_INFO = true

---G.TREE_SYMBOLS is a dictionary containing various symbols used in a context
---related to the visual representation of a hierarchical structure, such as a
---directory tree. Each key in the dictionary represents a symbolic name associated
---with a specific symbol, and the associated value is the character or set of
---characters represented by that symbol.
_G.TREE_SYMBOLS = {
    -- Change type
    added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
    modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
    deleted = "x", -- this can only be used in the git_status source
    renamed = "", -- this can only be used in the git_status source
    -- Status type
    untracked = "",
    ignored = "",
    unstaged = "",
    staged = "",
    conflict = "",
    -- Icons
    folder_closed = "",
    folder_open = "",
    folder_empty = "",
    modified_symbol = "[+]",
    indent_marker = "│",
    last_indent_marker = "└",
    expander_collapsed = "",
    expander_expanded = ""
}

---This variable stores the size of the file manager window.
_G.TREE_WIDTH = 35

---Address of the file tree window.
---1. left
---2. right
_G.TREE_DIRECTION = "left"

---This variable indicates whether there will be a virtual text in the code hints.
M.CMP_GHOST_TEXT = false
---This variable decides if the cmp menu (code hints) will have a border.
M.CMP_BORDER = true
---This variable indicates the type of border to be used in the code hints.
---1.default
---2 classic
---3 japan
---4 notebook
---5 box
---6 window
---7 notes
---8 solid
---9 fill
---10 modern
---11 braille
---12 braille_v2
---13 cyber
---14 pixel
---15 pixel2
M.CMP_BORDER_TYPE = "default"

---This table contains the list of LSP clients to be installed automatically.
_G.LSP_CLIENTS = {
    "lua_ls", "tsserver", "marksman", "pyright", "cssls", "jsonls", "emmet_ls",
    "tailwindcss", "html"
    -- "rust_analyzer",
    -- "clangd",
    -- "bashls",
    -- "vimls",
    -- "dockerls",
    -- "sqlls",
    -- "csharp_ls",
    -- "gopls",
    -- "jdtls",
    -- "docker_compose_language_service"
}

-- Indicates if you want to have a parameter highlight when calling a function.
_G.PARAMETER_HIGHLIGHTING = true

---This variable indicates which file types will be excluded from being formatted with neoformat and the default LSP formatting will be used.
_G.EXCLUDE_FORMATTERS_FILES = {"lua", "vim", "vimscript"}

---This variable indicates the order of the code formats to be used for each language.
---In this table you can easily configure the formatter.
---You can search the neoformat documentation: https://github.com/sbdchd/neoformat to find out which formatters are supported.
_G.CODE_FORMATTERS = {
    python = {'black'},
    javascript = {'prettier'},
    typescript = {'prettier'},
    html = {'prettier'},
    css = {'prettier'},
    scss = {'prettier'},
    javascriptreact = {'prettier'},
    typescriptreact = {'prettier'},
    json = {'prettier'},
    markdown = {'prettier'},
    xml = {'prettier'},
    yaml = {'prettier'},
    java = {'prettier'},
    kotlin = {'prettier'},
    less = {'prettier'},
    php = {'prettier'},
    astro = {'prettier'},
    ruby = {'prettier'},
    lua = {'luaformatter'},
    cpp = {'clangformat'},
    c = {'clangformat'},
    csharp = {'clangformat'},
    arduino = {'clangformat'},
    objc = {'clangformat'},
    go = {'gofmt'},
    assembly = {'asmfmt'},
    bazel = {'buildifier'},
    cmake = {'cmake_format'},
    csv = {'prettydiff'},
    dart = {'dartfmt'},
    erlang = {'erlfmt'},
    graphql = {'prettier'},
    toml = {'taplo'},
    htmldjango = {'djlint'},
    vue = {'prettier'},
    swift = {'Swiftformat'},
    sql = {'sqlfmt'},
    rust = {'rustfmt'},
    sass = {'stylelint'},
    pug = {'pug-beautifier'},
    zsh = {'shfmt'},
    svelte = {'prettierd'},
    ps1 = {'PSScriptAnalyzer'},
    prisma = {'prettier'},
    jsonc = {'prettier'},
    blade = {'blade-formatter'}
}

--- Messages
M.LSP_ALERTS_RUNNING = false

--- System

---This variable indicates whether you want to update the configuration of neovim when you open it.
M.AUTO_UPDATE = false

_G.GLOBALS = M

return M
