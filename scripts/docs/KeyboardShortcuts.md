<h1 align="center">Keyboard shortcuts</h1>

<p align="center">This neovim configuration tries as much as possible to use shortcuts common in other code editors, trying to be as close as possible to other editors like VSCode but with the accessibility of neovim.</p>

> _Note_
>
> By default the `<leader>` key is `space`, you can set it to whatever you need in the [init.lua](../init.lua) file in
> the `vim.g.mapleader` variable.

| KEY                | MODE          | COMMAND                                   | FUNCTION                                                                                        |
| ------------------ | ------------- | ----------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `Esc`              | normal insert | `<Esc>:VMClear <BAR> :nohl <CR>`          | Pressing the escape key tries to delete all selections made by the vim-multi plugin and by "/". |
| `q`                | normal        | `<cmd>:q<CR>`                             | Closes the current buffer or the editor                                                         |
| `<leader> + q + q` | normal        | `<cmd>:q!<CR>`                            | Forces the buffer to close                                                                      |
| `Ctrl + s`         | normal insert | `<cmd>:w<CR>`                             | Saves changes made to the buffer                                                                |
| `Ctrl + h + h`     | normal        | `<cmd>:bprevious<CR>`                     | Move to the previous buffer                                                                     |
| `Ctrl + l + l`     | normal        | `<cmd>:bnext<CR>`                         | Move to the next buffer                                                                         |
| `Ctrl + q + q`     | normal        | `<cmd>:Bdelete<CR>`                       | Closes the current buffer but does not close the entire editor                                  |
| `<leader> + n + r` | normal        | `<cmd>:vsplit<CR>`                        | Open a window with the current buffer on the right side.                                        |
| `<leader> + n + b` | normal        | `<cmd>:split<CR>`                         | Open a window with the current buffer on the bottom side.                                       |
| `Ctrl + f`         | normal insert | `<Esc>/`                                  | Allows you to search the buffer for the phrase you require                                      |
| `Ctrl + c`         | visual        | `y`                                       | Allows you to copy the selected text                                                            |
| `Ctrl + v`         | insert        | `<Esc>pi`                                 | Allows you to paste the previously copied text                                                  |
| `Ctrl + x`         | visual        | `d`                                       | Allows you to cut the selected text                                                             |
| `Ctrl + a`         | normal visual | `<Esc>gg0vG$`                             | Allows you to select all text in the current buffer                                             |
| `Ctrl + z`         | normal insert | `<cmd>:undo<CR>`                          | Desase the last change made                                                                     |
| `Ctrl + y`         | normal insert | `<cmd>:redo<CR>`                          | Restore the last discarded change                                                               |
| `Alt + Down`       | normal        | `yyp`                                     | Allows you to copy the line you are on at the bottom of the page.                               |
| `Shift + Down`     | normal        | `:m+1<CR>`                                | Moves the line to the bottom of the line.                                                       |
| `Ctrl + p`         | normal insert | `<cmd>:CommentToggle<CR>`                 | Comment on the current line                                                                     |
| `Ctrl + p`         | visual        | `<S-:>CommentToggle<CR>`                  | Comments on selected lines in visual mode                                                       |
| `Ctrl + b`         | normal insert | `<Esc><cmd>:NeoTreeFocusToggle<CR>`       | Allows you to open the Neotree plugin file tree.                                                |
| `<leader> + f + f` | normal        | `<cmd>Telescope fd<CR>`                   | Displays the list of files in the project.                                                      |
| `<leader> + f + e` | normal        | `<cmd>Telescope diagnostics<CR>`          | Displays the list of buffer diagnostic messages.                                                |
| `<leader> + f + b` | normal        | `<cmd>Telescope buffers<CR>`              | Displays the list of currently open buffers.                                                    |
| `<leader> + f + h` | normal        | `<cmd>Telescope help_tags<CR>`            | Displays the list of available aids.                                                            |
| `<leader> + h + h` | normal        | `<cmd>Telescope colorscheme<CR>`          | Displays the list of available themes for the editor.                                           |
| `<leader> + g + c` | normal        | `<cmd>Telescope git_commits<CR>`          | Displays the list of commits performed on the project.                                          |
| `<leader> + g + s` | normal        | `<cmd>Telescope git_status<CR>`           | Displays the list of changes to files in the git repository.                                    |
| `<leader> + g + f` | normal        | `<cmd>Telescope git_files<CR>`            | Displays the list of files in the git repository.                                               |
| `<leader> + g + b` | normal        | `<cmd>Telescope git_branches<CR>`         | Displays the list of branches that exist in a git repository.                                   |
| `<leader> + t + c` | normal        | `<cmd>TodoTelescope<CR>`                  | Displays the list of TODO comments in the project.                                              |
| `<leader> + t + r` | normal        | `<cmd>:botright vnew <BAR> :terminal<CR>` | This command will open a terminal on the right of the current buffer.                           |
| `<leader> + t + b` | normal        | `<cmd>:botright new <BAR> :terminal<CR>`  | This command will open a terminal at the bottom of the current buffer.                          |
| `<leader> + t`     | normal        | `<cmd>:ToggleTerm<CR>`                    | This command will open a toggleterm plugin terminal, by default a floating terminal.            |

### Git

| KEY        | MODE   | COMMAND                                        | FUNCTION                                                     |
| ---------- | ------ | ---------------------------------------------- | ------------------------------------------------------------ |
| `Ctrl + g` | normal | `<cmd>:Gitsigns toggle_current_line_blame<CR>` | Shows a virtual text line with the last changes in the line. |

### Execute files

| KEY                        | MODE   | COMMAND                           | FUNCTION                                                |
| -------------------------- | ------ | --------------------------------- | ------------------------------------------------------- |
| `<leader> + m + p`         | normal | `<cmd>:MarkdownPreviewToggle<CR>` | Allows to open the current markdown file in the browser |
| `<leader> + o + h`         | normal | `<cmd>:OpenHTML<CR>`              | Open an HTML file in the default browser                |
| `<leader> + r + p`         | normal | `<cmd>:RunPython<CR>`             | Execute the python file                                 |
| `<leader> + r + j + s`     | normal | `<cmd>:RunJavaScript<CR>`         | Execute the javascript file                             |
| `<leader> + r + c + p + p` | normal | `<cmd>:RunCPP<CR>`                | Execute the c++ file                                    |
| `<leader> + r + c`         | normal | `<cmd>:RunC<CR>`                  | Execute the c file                                      |
| `<leader> + r + t + s`     | normal | `<cmd>:RunTypeScript<CR>`         | Execute the typescript file                             |
| `<leader> + r + s + c + s` | normal | `<cmd>:RunScss<CR>`               | Execute the scss file                                   |
| `<leader> + r + g + o`     | normal | `<cmd>:RunGo<CR>`                 | Execute the go file                                     |

### LSP

| KEY                   | MODE   | COMMAND                                                                               | FUNCTION                                                                                   |
| --------------------- | ------ | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `Shift + Alt + f`     | normal | `validates_the_code_formatting_type`                                                  | Format the code using the function that discriminates which files to format with neoformat |
| `Shift + Alt + f + f` | normal | `vim.lsp.buf.format`                                                                  | Formats the code using the default LSP server formatter                                    |
| `Tab`                 | normal | `vim.lsp.buf.hover`                                                                   | Displays the information of the selected method or variable                                |
| `Ctrl + d`            | normal | `vim.lsp.buf.definition`                                                              | Open the buffer where you defined the function or variable you have selected               |
| `Ctrl + RightMouse`   | normal | `vim.lsp.buf.definition`                                                              | Open the buffer where you defined the function or variable you have selected               |
| `Ctrl + k`            | normal | `vim.lsp.buf.code_action`                                                             | Execute the client's codeactions                                                           |
| `Ctrl + e`            | normal | `function() vim.diagnostic.open_float(0, { scope = "line", border = "rounded" }) end` | Open diagnostic messages on selected line                                                  |

### CMP Autocomplete

| KEY            | MODE   | COMMAND                                                                         | FUNCTION                                      |
| -------------- | ------ | ------------------------------------------------------------------------------- | --------------------------------------------- |
| `Ctrl + space` | insert | `cmp.mapping.complete()`                                                        | Open the menu with suggestions for completion |
| `Ctrl + n`     | insert | `cmp.mapping.complete()`                                                        | Open the menu with suggestions for completion |
| `Ctrl + c`     | insert | `cmp.mapping(go_close_menu, { "i", "s" })`                                      | Closes the menu with suggestions to complete  |
| `Down`         | insert | `cmp.mapping(go_down_in_menu, { "i", "s" })`                                    | Scroll down the menu                          |
| `Up`           | insert | `cmp.mapping(go_up_in_menu, { "i", "s" })`                                      | Scroll up the menu                            |
| `Ctrl + j`     | insert | `cmp.mapping.scroll_docs(-4)`                                                   | Scrolls down in the menu jumping on 4 items   |
| `Ctrl + k`     | insert | `cmp.mapping.scroll_docs(4)`                                                    | Scrolls up in the menu jumping on 4 items     |
| `Enter`        | insert | `cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true, }` | Inserts the selected suggestion               |
