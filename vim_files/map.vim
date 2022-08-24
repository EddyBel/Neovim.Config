"-----------Configuracion de atajos basicos-------------
nnoremap <leader>qi :q<CR>
nnoremap <leader>wi :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qq :q!<CR>
"-----------Fin de la configuracion basica--------------


"--------------------Prettier---------------------------
" nnoremap <C-D> :Prettier<CR>
nnoremap <leader>pr :Prettier<CR>
"--------------------Fin--------------------------------


"-------------------Gestor de archivos NERD-------------
let NERDTreeQuitOnOpen=1
nnoremap <C-N> :NERDTreeFind<CR>
nnoremap <C-M> :NERDTreeToggle<CR>
"-------------------Fin---------------------------------

"------------------Telescope----------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>hh <cmd>Telescope colorscheme<cr>
"------------------Fin----------------------------------

"------------------Vim-Comment--------------------------
nnoremap <leader>ll :CommentToggle<CR>
"------------------Fin----------------------------------
