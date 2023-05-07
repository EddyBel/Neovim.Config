return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require 'nvim-treesitter.configs'.setup({
      -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      ignore_install = { "html", "yaml", "markdown", "markdown_inline" },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      -- Colorea las llaves, corchetes y parentesis segun se crean
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
          "#AF7AC5",
          "#1ABC9C",
          "#5DADE2",
          "#F7DC6F",
          "#E74C3C",
          "#F4F6F7"
        }, -- table of hex strings
        --termcolors = {} -- table of colour name strings
      }
    })
  end
}
