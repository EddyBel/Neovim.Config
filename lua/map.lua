-- ATAJOS DE TECLADO

vim.keymap.set('i', '<Esc>', '<Esc>:VMClear<CR>', { noremap = true }) -- Limpia lo que haga el plugin Visial-vim

-- ATAJOS DE ARCHIVOS Y BUFFERS

vim.keymap.set('n', '<C-Q>', ':q<CR>', { noremap = true })                  -- Cerrar el buffer
vim.keymap.set('n', '<C-S>', ':w<CR>', { noremap = true })                  -- Guardar el buffer
vim.keymap.set('i', '<C-S>', '<Esc>:w<CR>a', { noremap = true })            -- Guardar el buffer
vim.keymap.set('n', '<leader>qq', ':q!<CR>', { noremap = true })            -- Forzar el cierre del buffer
vim.keymap.set('n', '<C-h><C-h>', ':bprevious<CR>', { noremap = true })     -- Muevete al anterior buffer (left)
vim.keymap.set('n', '<C-l><C-l>', ':bnext<CR>', { noremap = true })         -- Muevete al siguiente buffer (right)
vim.keymap.set('n', '<C-q><C-q>', ':Bdelete<CR>', { noremap = true })       -- Cierra la pestaña o buffer en el que estes
vim.keymap.set('n', '<leader>nr', ':botright vnew<CR>', { noremap = true }) -- Abre un nuevo espacio de trabajo (right)
vim.keymap.set('n', '<leader>nb', ':botright new<CR>', { noremap = true })  -- Abre un nuevo espacio de trabajo (bottom)
vim.keymap.set('n', '<C-B>', ':NeoTreeFocusToggle<CR>', { noremap = true }) -- Abre el arbol de archivos

-- ATAJOS DE MANIPULACIÓN DE TEXTO

vim.keymap.set('v', '<C-c>', 'y', { noremap = true })                        -- Copiar en el documento
vim.keymap.set('i', '<C-v>', 'p', { noremap = true })                        -- Pegar en el documento
vim.keymap.set('v', '<C-x>', 'd', { noremap = true })                        -- Corta el texto
vim.keymap.set('n', '<C-a>', 'gg0vG$', { noremap = true })                   -- Selecciona todo el texto del documento
vim.keymap.set('v', '<C-a>', '<Esc>gg0vG$', { noremap = true })              -- Selecciona todo el texto del documento
vim.keymap.set('n', '<A-Down>', 'yyp', { noremap = true })                   -- Copia la linea en la parte inferior
vim.keymap.set('n', '<S-Down>', ':m+1<CR>', { noremap = true })              -- Mueve la linea a la parte inferior de la siguiente
vim.keymap.set('n', '<S-Up>', ':m-2<CR>', { noremap = true })                -- Mueve la linea a la parte superior de la siguiente
vim.keymap.set('i', '<C-z>', '<Esc>:undo<CR>', { noremap = true })           -- Desase los cambios (Insertar)
vim.keymap.set('n', '<C-z>', ':undo<CR>', { noremap = true })                -- Desase los cambios
vim.keymap.set('n', '<C-y>', ':redo<CR>', { noremap = true })                -- Reconstruye los cambios
vim.keymap.set('n', '<C-p>', ':CommentToggle<CR>', { noremap = true })       -- Comenta la linea donde te encuentras
vim.keymap.set('i', '<C-p>', '<Esc>:CommentToggle<CR>a', { noremap = true }) -- Comenta la linea donde te encuentras (Insertar)

-- ATAJOS PARA LA TERMINAL

vim.keymap.set('n', '<leader>tr', ':botright vnew <BAR> :terminal<CR>', { noremap = true }) -- Abre la terminal en la parte de la derecha
vim.keymap.set('n', '<leader>tb', ':botright new <BAR> :terminal<CR>', { noremap = true })  -- Abre la terminal en la parte inferior
vim.keymap.set('n', '<leader>t', ':ToggleTerm <CR>', { noremap = true })                    -- Abre la terminal en modo flotante

-- ATAJOS DE TELESCOPE

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope fd<CR>', { noremap = true })           -- Muestra todos los archivos del documento
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope diagnostics<CR>', { noremap = true })  --
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })      -- Muestra los archivos y sus documentos
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })    --
vim.keymap.set('n', '<leader>hh', '<cmd>Telescope colorscheme<CR>', { noremap = true })  -- Muestra la lista de temas disponibles
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { noremap = true })  -- Muestra la lista de commits disponibles
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { noremap = true })   -- Muestra ek estatus del proyecto disponibles
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { noremap = true })    -- Muestra la lista de archivos git disponibles
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', { noremap = true }) -- Muestra la lista de branchs disponibles

-- ATAJOS DE GIT

vim.keymap.set('n', '<C-g>', ':Gitsigns toggle_current_line_blame<CR>', { noremap = true }) -- Muestra en la linea los cambios que se han hecho al archivo

-- ATAJOS DE LSP O ANALIZADOR DE SINTAXIS

vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, { noremap = true })      -- Formatea el documentos
vim.keymap.set('n', '<Tab>', vim.lsp.buf.hover, { noremap = true })       -- Muestra inforamcion del código
vim.keymap.set('n', '<C-d>', vim.lsp.buf.definition, { noremap = true })  -- Dirigete a la definición del metodo
vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, { noremap = true }) --
vim.keymap.set('n', '<C-e>', function()
  vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })
end, { noremap = true }) -- Habre en una ventana flotante los diagnosticos de error
