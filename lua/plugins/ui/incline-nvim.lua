local globals = require('globals')
local FILEBAR = globals.FILEBAR
-- local ICONS = globals.ICONS

return {
    'b0o/incline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'BufReadPre',
    enabled = function() return FILEBAR.enabled end,
    config = function()
        local devicons = require 'nvim-web-devicons'
        local helpers = require 'incline.helpers'
        require('incline').setup {
            hide = {
                cursorline = true,
                focused_win = false,
                only_win = false
            },
            window = {
                margin = {
                    horizontal = 0,
                    vertical = 0
                },
                options = {
                    signcolumn = "no",
                    wrap = false
                },
                overlap = {
                    borders = true,
                    statusline = false,
                    tabline = false,
                    winbar = false
                },
                padding = 1,
                padding_char = " ",
                placement = {
                    horizontal = "right",
                    vertical = "top"
                },
                width = "fit",
                winhighlight = {
                    active = {
                        EndOfBuffer = "None",
                        Normal = "InclineNormal",
                        Search = "None"
                    },
                    inactive = {
                        EndOfBuffer = "None",
                        Normal = "InclineNormalNC",
                        Search = "None"
                    }
                },
                zindex = 100
            },
            render = function(props)
                local divider = FILEBAR.divider .. " "
                local filename = vim.fn.fnamemodify(vim.api
                    .nvim_buf_get_name(
                        props.buf), ':t')
                if filename == '' then
                    filename = globals.FILEBAR.indicator.file_name_not_found
                end
                local ft_icon, ft_color = devicons.get_icon_color(filename)

                local function get_modified_state()
                    local icons = {
                        modified = FILEBAR.indicator.file_modified,
                        saved = FILEBAR.indicator.file_saved
                    }
                    local colors = { modified = 'yellow', saved = 'green' }
                    -- Verifica si el buffer ha sido modificado
                    if vim.bo[props.buf].modified then
                        return {
                            icons.modified .. ' ',
                            guifg = colors.modified,
                            guibg = 'none'
                        }
                    else
                        return {
                            icons.saved .. ' ',
                            guifg = colors.saved,
                            guibg = 'none'
                        }
                    end
                end

                local function get_git_diff()
                    local icons = {
                        removed = ICONS.git.removed,
                        changed = ICONS.git.modified,
                        added = ICONS.git.add
                    }
                    local signs = vim.b[props.buf].gitsigns_status_dict
                    local labels = {}
                    if signs == nil then
                        return labels
                    end
                    for name, icon in pairs(icons) do
                        if tonumber(signs[name]) and signs[name] > 0 then
                            table.insert(labels, {
                                icon .. ' ' .. signs[name] .. ' ',
                                group = 'Diff' .. name
                            })
                        end
                    end
                    if #labels > 0 then
                        table.insert(labels, divider)
                    end
                    return labels
                end

                local function get_diagnostic_label()
                    local icons = {
                        error = ICONS.error,
                        warn = ICONS.warn,
                        info = ICONS.info,
                        hint = ICONS.hint
                    }
                    local label = {}

                    for severity, icon in pairs(icons) do
                        local n = #vim.diagnostic.get(props.buf, {
                            severity = vim.diagnostic.severity[string.upper(
                                severity)]
                        })
                        if n > 0 then
                            table.insert(label, {
                                icon .. ' ' .. n .. ' ',
                                group = 'DiagnosticSign' .. severity,
                                guibg = 'none'
                            })
                        end
                    end
                    if #label > 0 then
                        table.insert(label, divider)
                    end
                    return label
                end

                -- guifg = ft_color, guibg = 'none'
                return {
                    {
                        ' ',
                        ft_icon or
                        FILEBAR.indicator.file_icon_not_found,
                        ' ',
                        guibg = ft_color,
                        guifg = helpers.contrast_color(ft_color)
                    }, {
                    ' ',
                    filename,
                    ' ',
                    gui = vim.bo[props.buf].modified and 'bold,italic' or
                        'bold'
                }, { get_modified_state() }, { divider },
                    { get_diagnostic_label() }, { get_git_diff() },
                    -- {
                    --     globals.FILEBAR.indicator.buffer_window_index .. ' ' ..
                    --     vim.api.nvim_win_get_number(props.win),
                    --     group = 'DevIconWindows'
                    -- },
                    { FILEBAR.indicator.buffer_window_index, ' ', ENV.NUMBER_OPEN_BUFFERS, ' ', group = 'DevIconWindows' }
                }
            end
        }
    end
}
