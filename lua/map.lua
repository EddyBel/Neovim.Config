-- ATAJOS DE TECLADO

vim.api.nvim_set_keymap('n', '<C-Q>', ':q<CR>', { noremap = true })                                  -- Cerrar el buffer
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true })                                  -- Guardar el buffer
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>a', { noremap = true })                            -- Guardar el buffer
vim.api.nvim_set_keymap('n', '<leader>qq', ':q!<CR>', { noremap = true })                            -- Forzar el cierre del buffer
vim.api.nvim_set_keymap('v', '<C-c>', 'y', { noremap = true })                                       -- Copiar en el documento
vim.api.nvim_set_keymap('i', '<C-v>', 'p', { noremap = true })                                       -- Pegar en el documento
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>:undo<CR>', { noremap = true })                          -- Desase los cambios
vim.api.nvim_set_keymap('n', '<C-z>', ':undo<CR>', { noremap = true })                               -- Desase los cambios
vim.api.nvim_set_keymap('n', '<C-y>', ':redo<CR>', { noremap = true })                               -- Reconstruye los cambios
vim.api.nvim_set_keymap('n', '<C-f>', ':lua vim.lsp.buf.format()<CR>', { noremap = true })           -- Formatea el documentos
vim.api.nvim_set_keymap('n', '<C-h><C-h>', ':bprevious<CR>', { noremap = true })                     -- Muevete al anterior buffer (left)
vim.api.nvim_set_keymap('n', '<C-l><C-l>', ':bnext<CR>', { noremap = true })                         -- Muevete al siguiente buffer (right)
vim.api.nvim_set_keymap('n', '<C-q><C-q>', ':bdelete!<CR>', { noremap = true })                      -- Cierra la pestaña o buffer en el que estes
vim.api.nvim_set_keymap('n', '<leader>tr', ':botright vnew <BAR> :terminal<CR>', { noremap = true }) -- Abre la terminal en la parte de la derecha
vim.api.nvim_set_keymap('n', '<leader>tb', ':botright new <BAR> :terminal<CR>', { noremap = true })  -- Abre la terminal en la parte inferior
vim.api.nvim_set_keymap('n', '<leader>nr', ':botright vnew<CR>', { noremap = true })                 -- Abre un nuevo espacio de trabajo (right)
vim.api.nvim_set_keymap('n', '<leader>nb', ':botright new<CR>', { noremap = true })                  -- Abre un nuevo espacio de trabajo (bottom)
vim.api.nvim_set_keymap('n', '<C-B>', ':NERDTreeToggle<CR>', { noremap = true })                     -- Abre el arbol de archivos
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })      -- Muestra todos los archivos del documento
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })       --
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true })         -- Muestra los archivos y sus documentos
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })       --
vim.api.nvim_set_keymap('n', '<leader>hh', '<cmd>Telescope colorscheme<CR>', { noremap = true })     -- Muestra la lista de temas disponibles
vim.api.nvim_set_keymap('n', '<C-p>', ':CommentToggle<CR>', { noremap = true })                      -- Comenta la linea en donde te encuentras
vim.api.nvim_set_keymap('i', '<C-p>', '<Esc>:CommentToggle<CR>a', { noremap = true })                -- Comenta la linea donde te encuentras (insertar)
vim.api.nvim_set_keymap('n', '<Tab>', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })            -- Muestra inforamcion del código
vim.api.nvim_set_keymap('n', '<C-d>', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })       -- Dirigete a la definición del metodo

-- LSP-Installer
-- vim.api.nvim_set_keymap('n', '<leader>lspin', ':LspInstallInfo<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>lspif', ':LspInfo<CR>', { noremap = true })
