export const keymaps_base = [
  {
    key: '<Esc>',
    mode: 'normal insert',
    command: '<Esc>:VMClear <BAR> :nohl <CR>',
    function: 'Pressing the escape key tries to delete all selections made by the vim-multi plugin and by "/".',
  },
];

export const keymaps_buffer = [
  {
    key: 'q',
    mode: 'normal',
    command: '<cmd>:q<CR>',
    function: 'Closes the current buffer or the editor',
  },
  {
    key: '<leader> + q + q',
    mode: 'normal',
    command: '<cmd>:q!<CR>',
    function: 'Forces the buffer to close',
  },
  {
    key: 'Ctrl + s',
    mode: 'normal insert',
    command: '<cmd>:w<CR>',
    function: 'Saves changes made to the buffer',
  },
  {
    key: 'Ctrl + h + h',
    mode: 'normal',
    command: '<cmd>:bprevious<CR>',
    function: 'Move to the previous buffer',
  },
  {
    key: 'Ctrl + l + l',
    mode: 'normal',
    command: '<cmd>:bnext<CR>',
    function: 'Move to the next buffer',
  },
  {
    key: 'Ctrl + q + q',
    mode: 'normal',
    command: '<cmd>:Bdelete<CR>',
    function: 'Closes the current buffer but does not close the entire editor',
  },
  {
    key: '<leader> + n + r',
    mode: 'normal',
    command: '<cmd>:vsplit<CR>',
    function: 'Open a window with the current buffer on the right side.',
  },
  {
    key: '<leader> + n + b',
    mode: 'normal',
    command: '<cmd>:split<CR>',
    function: 'Open a window with the current buffer on the bottom side.',
  },
  {
    key: 'Ctrl + f',
    mode: 'normal insert',
    command: '<Esc>/',
    function: 'Allows you to search the buffer for the phrase you require',
  },
];

export const keymaps_textmanipulation = [
  {
    key: 'Ctrl + c',
    mode: 'visual',
    command: 'y',
    function: 'Allows you to copy the selected text',
  },
  {
    key: 'Ctrl + v',
    mode: 'insert',
    command: '<Esc>pi',
    function: 'Allows you to paste the previously copied text',
  },
  {
    key: 'Ctrl + x',
    mode: 'visual',
    command: 'd',
    function: 'Allows you to cut the selected text',
  },
  {
    key: 'Ctrl + a',
    mode: 'normal visual',
    command: '<Esc>gg0vG$',
    function: 'Allows you to select all text in the current buffer',
  },
  {
    key: 'Ctrl + z',
    mode: 'normal insert',
    command: '<cmd>:undo<CR>',
    function: 'Desase the last change made',
  },
  {
    key: 'Ctrl + y',
    mode: 'normal insert',
    command: '<cmd>:redo<CR>',
    function: 'Restore the last discarded change',
  },
  {
    key: 'Alt + Down',
    mode: 'normal',
    command: 'yyp',
    function: 'Allows you to copy the line you are on at the bottom of the page.',
  },
  {
    key: 'Shift + Down',
    mode: 'normal',
    command: ':m+1<CR>',
    function: 'Moves the line to the bottom of the line.',
  },
  {
    key: 'Ctrl + p',
    mode: 'normal insert',
    command: '<cmd>:CommentToggle<CR>',
    function: 'Comment on the current line',
  },
  {
    key: 'Ctrl + p',
    mode: 'visual',
    command: '<S-:>CommentToggle<CR>',
    function: 'Comments on selected lines in visual mode',
  },
];

export const keymaps_filemanager = [
  {
    key: 'Ctrl + b',
    mode: 'normal insert',
    command: '<Esc><cmd>:NeoTreeFocusToggle<CR>',
    function: 'Allows you to open the Neotree plugin file tree.',
  },
  {
    key: '<leader> + f + f',
    mode: 'normal',
    command: '<cmd>Telescope fd<CR>',
    function: 'Displays the list of files in the project.',
  },
  {
    key: '<leader> + f + e',
    mode: 'normal',
    command: '<cmd>Telescope diagnostics<CR>',
    function: 'Displays the list of buffer diagnostic messages.',
  },
  {
    key: '<leader> + f + b',
    mode: 'normal',
    command: '<cmd>Telescope buffers<CR>',
    function: 'Displays the list of currently open buffers.',
  },
  {
    key: '<leader> + f + h',
    mode: 'normal',
    command: '<cmd>Telescope help_tags<CR>',
    function: 'Displays the list of available aids.',
  },
  {
    key: '<leader> + h + h',
    mode: 'normal',
    command: '<cmd>Telescope colorscheme<CR>',
    function: 'Displays the list of available themes for the editor.',
  },
  {
    key: '<leader> + g + c',
    mode: 'normal',
    command: '<cmd>Telescope git_commits<CR>',
    function: 'Displays the list of commits performed on the project.',
  },
  {
    key: '<leader> + g + s',
    mode: 'normal',
    command: '<cmd>Telescope git_status<CR>',
    function: 'Displays the list of changes to files in the git repository.',
  },
  {
    key: '<leader> + g + f',
    mode: 'normal',
    command: '<cmd>Telescope git_files<CR>',
    function: 'Displays the list of files in the git repository.',
  },
  {
    key: '<leader> + g + b',
    mode: 'normal',
    command: '<cmd>Telescope git_branches<CR>',
    function: 'Displays the list of branches that exist in a git repository.',
  },
  {
    key: '<leader> + t + c',
    mode: 'normal',
    command: '<cmd>TodoTelescope<CR>',
    function: 'Displays the list of TODO comments in the project.',
  },
];

export const keymaps_terminal = [
  {
    key: '<leader> + t + r',
    mode: 'normal',
    command: '<cmd>:botright vnew <BAR> :terminal<CR>',
    function: 'This command will open a terminal on the right of the current buffer.',
  },
  {
    key: '<leader> + t + b',
    mode: 'normal',
    command: '<cmd>:botright new <BAR> :terminal<CR>',
    function: 'This command will open a terminal at the bottom of the current buffer.',
  },
  {
    key: '<leader> + t',
    mode: 'normal',
    command: '<cmd>:ToggleTerm<CR>',
    function: 'This command will open a toggleterm plugin terminal, by default a floating terminal.',
  },
];

export const keymaps_execute_files = [
  {
    key: '<leader> + m + p',
    mode: 'normal',
    command: '<cmd>:MarkdownPreviewToggle<CR>',
    function: 'Allows to open the current markdown file in the browser',
  },
  {
    key: '<leader> + o + h',
    mode: 'normal',
    command: '<cmd>:OpenHTML<CR>',
    function: 'Open an HTML file in the default browser',
  },
  {
    key: '<leader> + r + p',
    mode: 'normal',
    command: '<cmd>:RunPython<CR>',
    function: 'Execute the python file',
  },
  {
    key: '<leader> + r + j + s',
    mode: 'normal',
    command: '<cmd>:RunJavaScript<CR>',
    function: 'Execute the javascript file',
  },
  {
    key: '<leader> + r + c + p + p',
    mode: 'normal',
    command: '<cmd>:RunCPP<CR>',
    function: 'Execute the c++ file',
  },
  {
    key: '<leader> + r + c',
    mode: 'normal',
    command: '<cmd>:RunC<CR>',
    function: 'Execute the c file',
  },
  {
    key: '<leader> + r + t + s',
    mode: 'normal',
    command: '<cmd>:RunTypeScript<CR>',
    function: 'Execute the typescript file',
  },
  {
    key: '<leader> + r + s + c + s',
    mode: 'normal',
    command: '<cmd>:RunScss<CR>',
    function: 'Execute the scss file',
  },
  {
    key: '<leader> + r + g + o',
    mode: 'normal',
    command: '<cmd>:RunGo<CR>',
    function: 'Execute the go file',
  },
];

export const keymaps_git = [
  {
    key: 'Ctrl + g',
    mode: 'normal',
    command: '<cmd>:Gitsigns toggle_current_line_blame<CR>',
    function: 'Shows a virtual text line with the last changes in the line.',
  },
];

export const keymaps_lsp = [
  {
    key: 'Shift + Alt + f',
    mode: 'normal',
    command: 'validates_the_code_formatting_type',
    function: 'Format the code using the function that discriminates which files to format with neoformat',
  },
  {
    key: 'Shift + Alt + f + f',
    mode: 'normal',
    command: 'vim.lsp.buf.format',
    function: 'Formats the code using the default LSP server formatter',
  },
  {
    key: 'Tab',
    mode: 'normal',
    command: 'vim.lsp.buf.hover',
    function: 'Displays the information of the selected method or variable',
  },
  {
    key: 'Ctrl + d',
    mode: 'normal',
    command: 'vim.lsp.buf.definition',
    function: 'Open the buffer where you defined the function or variable you have selected',
  },
  {
    key: 'Ctrl + RightMouse',
    mode: 'normal',
    command: 'vim.lsp.buf.definition',
    function: 'Open the buffer where you defined the function or variable you have selected',
  },
  {
    key: 'Ctrl + k',
    mode: 'normal',
    command: 'vim.lsp.buf.code_action',
    function: "Execute the client's codeactions",
  },
  {
    key: 'Ctrl + e',
    mode: 'normal',
    command: 'function() vim.diagnostic.open_float(0, { scope = "line", border = "rounded" }) end',
    function: 'Open diagnostic messages on selected line',
  },
];

export const keymaps_autocomplete = [
  {
    key: 'Ctrl + space',
    mode: 'insert',
    command: 'cmp.mapping.complete()',
    function: 'Open the menu with suggestions for completion',
  },
  {
    key: 'Ctrl + n',
    mode: 'insert',
    command: 'cmp.mapping.complete()',
    function: 'Open the menu with suggestions for completion',
  },
  {
    key: 'Ctrl + c',
    mode: 'insert',
    command: 'cmp.mapping(go_close_menu, { "i", "s" })',
    function: 'Closes the menu with suggestions to complete',
  },
  {
    key: 'Down',
    mode: 'insert',
    command: 'cmp.mapping(go_down_in_menu, { "i", "s" })',
    function: 'Scroll down the menu',
  },
  {
    key: 'Up',
    mode: 'insert',
    command: 'cmp.mapping(go_up_in_menu, { "i", "s" })',
    function: 'Scroll up the menu',
  },
  {
    key: 'Ctrl + j',
    mode: 'insert',
    command: 'cmp.mapping.scroll_docs(-4)',
    function: 'Scrolls down in the menu jumping on 4 items',
  },
  {
    key: 'Ctrl + k',
    mode: 'insert',
    command: 'cmp.mapping.scroll_docs(4)',
    function: 'Scrolls up in the menu jumping on 4 items',
  },
  {
    key: 'Enter',
    mode: 'insert',
    command: 'cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true, }',
    function: 'Inserts the selected suggestion',
  },
];

const keymaps: any[] = [];
export default keymaps.concat(
  keymaps_base,
  keymaps_filemanager,
  keymaps_textmanipulation,
  keymaps_git,
  keymaps_lsp,
  keymaps_buffer,
  keymaps_terminal,
  keymaps_autocomplete,
  keymaps_execute_files,
);
