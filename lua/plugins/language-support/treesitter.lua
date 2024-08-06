local cpp_compilers = {
    "gcc",       -- GNU C Compiler
    "g++",       -- GNU C++ Compiler
    "clang++",   -- Clang C++ Compiler
    "icc",       -- Intel C++ Compiler
    "xlc++",     -- IBM XL C++ Compiler
    "c++",       -- Genérico, puede estar vinculado a varios compiladores
    "dpcpp",     -- Intel oneAPI DPC++/C++ Compiler
    "tce++",     -- TCE C++ Compiler
    "aCC",       -- HP aCC (Advanced C++ Compiler)
    "pathscale", -- PathScale C++ Compiler
    "pgiCC",     -- PGI C++ Compiler
    "sunCC"      -- Oracle Solaris Studio C++ Compiler
}

return {
    "nvim-treesitter/nvim-treesitter",
    event = 'VeryLazy',
    build = ":TSUpdate",
    enabled = function()
        local commands = cpp_compilers
        local check, _ = UTILS.check_commands(commands)
        return check
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "python", "javascript",
                "typescript", "bash", "html", "css", "scss", "yaml", "markdown",
                "markdown_inline", "go", "cpp"
            },
            sync_install = false,
            auto_install = true,
            -- highlight = {enable = true},
            indent = { enable = true },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat,
                        vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false
            },

            -- Colorea las llaves, corchetes y parentesis segun se crean
            rainbow = {
                enable = true,
                -- disable = { "html" }, -- list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                colors = {
                    "#AF7AC5", "#1ABC9C", "#5DADE2", "#F7DC6F", "#E74C3C",
                    "#F4F6F7"
                } -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            }
        })
    end
}
