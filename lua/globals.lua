---This variable contains the name of the theme to be used
---
---It is important to note that to place any custom theme
---you must install it in the editor, the configuration and
---installation of the theme can be done in the "themes.lua"
---file in the "plugins" folder "./plugins/themes.lua".
---
---Available topics
---1. kanagawa-wave, kanagawa-dragon, kanagawa-lotus
---2. catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
---3. rose-pine, rose-pine-moon, rose-pine-dawn
---4. onedark
---5. gruvbox
---6. carbonfox, terafox, nordfox, duskfox, dawnfox, dayfox, nightfox
---7. oxocarbon
---8. dracula
---9. tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
---10. onenord, onenord-light
---12. ayu-dark, ayu-light, ayu-mirage
---13. vscode
---14. github_dark, github_dark_dimmed, github_dark_high_contrast, github_dark_colorblind, github_dark_tritanopia, github_light, github_light_default, github_light_colorblind, github_light_tritanopia
---15. everforest
_G.COLOR_THEME = "everforest"

---This variable defines whether you want a transparent background in the editor.
_G.BACKGROUND_TRANSPARENT = false

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
_G.STATUSBAR = {
    theme = 'auto',
    separator = { left = '', right = '' },
    -- decorator = { left = '', right = '' },
    decorator = { left = '', right = '' },
    type = "completed v2"
}

---This variable stores the front drawing ASCII that can be displayed when neovim is started.
---It is imported from the drawing file saved in the neovim configuration.
_G.ALPHA = require("utils.drawings").min_hydra

---This table stores the colors to be used by the modicator plugin.
---highlighting the line number in which it is located for each mode.
_G.COLOR_LINE = {
    normal = "#BB8FCE",
    insert = "#85C1E9",
    visual = "#F7DC6F",
    select = "#F7F9F9",
    replacement = "#EC7063",
    command = "#58D68D",
    visual_line = "#F9E79F",
    insert_code = "#2E86C1",
    select_line = "#D7DBDD"
}

---This variable defines the search pattern to search ALL in the code.
---
---Patterns
---1. [[.*(KEYWORDS).*]] => TODO
---2. [[.*<(KEYWORDS)\s*:]] => <TODO:
---3. [[.*\s(KEYWORDS)\s*]] =>  TODO (TODO with a space before)
---4. [[.*(KEYWORDS)*:]] => TODO:
_G.TODO_PATTERN = [[.*(KEYWORDS).*]]

---This object defines the icons that will be used by the comments throughout the code.
---The sings property defines whether to use icons at the side of the comment.
_G.TODO_ICONS = {
    signs = true, -- Defines whether icons will be used
    type = "fg",  -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
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
    prefix = "",     -- Prefix displayed in the virtual text
    error = '',      -- Error icon
    warn = '',       -- Warning icon
    info = '󰅺',      -- Info icon
    hint = '',       -- Hint icon
    time = '󱑃',      --  Icon representing each operating system
    formatter = "",  -- Icon representing code formatter
    lsp = "",        -- Icon representing LSP clients
    cmp_buffer = "", -- Icon representing Buffer suggestions
    cmp_lua = "",    -- Icon that represents the suggestions of lua
    cmp_path = "",   -- Icon representing route suggestions
    cmp_snippets = "", -- Icon representing snippet suggestions (snippy)
    cmp_vsnip = "󰨞", -- Icon representing vsnip suggestions
    cmp_luasnip = "", -- Icon representing lua snippet suggestions
    cmp_db = "",     -- Icon representing database suggestions
    copilot = {
        enable = "",
        disable = "",
        warning = "",
    }, -- Icons representing the copilot status
    git = {
        add = "",
        removed = "",
        modified = ""
    },                                                                   -- Icons indicating the status of git changes
    spinner = { "⠿", "⠞", "⠇", "⠑", "⠝", "⠞", "⠎", "⠕", "⠍", "⠑", "⠋" }, -- Icons representing the loading animation
    os = {
        ["Windows"] = "󰍲",
        ["Darwin"]  = "",
        ["Ubuntu"]  = "",
        ["Kali"]    = "",
        ["Arch"]    = "",
        ["Debian"]  = "",
        ["Fedora"]  = "",
        ["Parrot"]  = "",
        ["Linux"]   = "",
        ["Default"] = ""
    } --  Icons representing each operating system
}

---G.GIT is a dictionary containing different icons used in a context
---related to Git version control. Each key in the dictionary represents
---a symbolic name associated with a specific icon, and the associated
---value is the character representing that icon.
_G.GIT_SYMBOLS = {
    add          = '│',
    change       = '│',
    delete       = '_',
    topdelete    = '‾',
    changedelete = '~',
    untracked    = '┆',
}

---This variabel indicates if you want to show information of the last commit in each line of the editor.
_G.GIT_INFO = true

---G.TREE_SYMBOLS is a dictionary containing various symbols used in a context
---related to the visual representation of a hierarchical structure, such as a
---directory tree. Each key in the dictionary represents a symbolic name associated
---with a specific symbol, and the associated value is the character or set of
---characters represented by that symbol.
_G.TREE_SYMBOLS = {
    -- Change type
    added              = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
    modified           = "", -- or "", but this is redundant info if you use git_status_colors on the name
    deleted            = "x", -- this can only be used in the git_status source
    renamed            = "", -- this can only be used in the git_status source
    -- Status type
    untracked          = "",
    ignored            = "",
    unstaged           = "",
    staged             = "",
    conflict           = "",
    -- Icons
    folder_closed      = "",
    folder_open        = "",
    folder_empty       = "",
    modified_symbol    = "[+]",
    indent_marker      = "│",
    last_indent_marker = "└",
    expander_collapsed = "",
    expander_expanded  = "",
}

---This variable stores the size of the file manager window.
_G.TREE_WIDTH = 35

---Address of the file tree window.
---1. left
---2. right
_G.TREE_DIRECTION = "left"

---This variable indicates whether there will be a virtual text in the code hints.
_G.CMP_GHOST_TEXT = true

---This table contains the list of LSP clients to be installed automatically.
_G.LSP_CLIENTS = {
    "lua_ls",
    "tsserver",
    "marksman",
    "pyright",
    "cssls",
    "jsonls",
    "emmet_ls",
    "html",
    -- "rust_analyzer",
    -- "clangd",
    -- "tailwindcss",
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
_G.EXCLUDE_FORMATTERS_FILES = { "lua", "vim", "vimscript" }

---This variable indicates the order of the code formats to be used for each language.
---In this table you can easily configure the formatter.
---You can search the neoformat documentation: https://github.com/sbdchd/neoformat to find out which formatters are supported.
_G.CODE_FORMATTERS = {
    python = { 'black' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    scss = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
    xml = { 'prettier' },
    yaml = { 'prettier' },
    java = { 'prettier' },
    kotlin = { 'prettier' },
    less = { 'prettier' },
    php = { 'prettier' },
    astro = { 'prettier' },
    ruby = { 'prettier' },
    lua = { 'luaformatter' },
    cpp = { 'clangformat' },
    c = { 'clangformat' },
    csharp = { 'clangformat' },
    arduino = { 'clangformat' },
    objc = { 'clangformat' },
    go = { 'gofmt' },
    assembly = { 'asmfmt' },
    bazel = { 'buildifier' },
    cmake = { 'cmake_format' },
    csv = { 'prettydiff' },
    dart = { 'dartfmt' },
    erlang = { 'erlfmt' },
    graphql = { 'prettier' },
    toml = { 'taplo' },
    htmldjango = { 'djlint' },
    vue = { 'prettier' },
    swift = { 'Swiftformat' },
    sql = { 'sqlfmt' },
    rust = { 'rustfmt' },
    sass = { 'stylelint' },
    pug = { 'pug-beautifier' },
    zsh = { 'shfmt' },
    svelte = { 'prettierd' },
    ps1 = { 'PSScriptAnalyzer' },
    prisma = { 'prettier' },
    jsonc = { 'prettier' },
    blade = { 'blade-formatter' }
}
