" STANDARD CONFIGURATION FOR NEOVIM

set number " View number line
set mouse=a " Activate mouse interactive
"syntax enable
set encoding=utf-8 " Encoding UTF-8 activate
set nowrap " Disable auto autotuning
set clipboard=unnamed " Uses the system clipboard
set noswapfile " No file swap
set nobackup
set nowritebackup
set noswapfile
set backspace=indent,eol,start    " backspace everywhere in insert mode
set autoindent " autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>
set splitbelow splitright   " Set the splits to open at the right side and below
set hidden                  " to hide warning when opening files
set ignorecase              " to ignore case in searchs
set scrolloff=8               " Keep at least 8 lines below cursor
set number relativenumber   " Relative numbers for jumping
set nu rnu  "Hybrid. Relative numbers and the current line number
set splitbelow splitright   " Set the splits to open at the right side and below
set foldmethod=manual "To avoid performance issues, I never fold anything
set lazyredraw
set ttyfast
set showmatch      " higlight matching parentheses and brackets
set wildmenu       " enable visual wildmenu
set nohlsearch     " clear highlight after a search
let mapleader = " "

" KEYBOARD SHORTCUTS

nnoremap <C-Q> :q<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>a
nnoremap <leader>qq :q!<CR>
vnoremap <C-c> y
inoremap <C-v> <Esc>pi
vnoremap <C-x> d
nnoremap <C-a> gg0vG$
vnoremap <C-a> <Esc>gg0vG$
nnoremap <A-Down> yyp
nnoremap <S-Down> :m+1<CR>
nnoremap <S-Up> :m-2<CR>
inoremap <C-z> <Esc>:undo<CR>
nnoremap <C-z> :undo<CR>
nnoremap <C-y> :redo<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

"This section validates if vimplug is installed on the system if it is not
" then install it.

if has('win32')
    let s:plug_path = expand('$HOME/vimfiles/autoload/plug.vim')
      let s:install_cmd = 'iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force'
else
    let s:plug_path = expand('~/.vim/autoload/plug.vim')
      let s:install_cmd = 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

if empty(glob(s:plug_path))
    echo "Vimplug no está instalado. Instalando..."
      execute '!' . s:install_cmd
        echo "Vimplug instalado correctamente."
endif

" Prepare the plugins to be installed

call plug#begin('~/vimfiles/plugins')   "directorio donde se van a instalar los plugins

Plug 'morhetz/gruvbox' "Theme
Plug 'Yggdroot/indentLine'    "indentacion
Plug 'vim-airline/vim-airline'    "diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes' "temas para el vim-airline
Plug 'preservim/nerdtree'   "gestor de archivos en forma de arbol.
Plug 'christoomey/vim-tmux-navigator' "poder navegar entre archivos abiertos
Plug 'jiangmiao/auto-pairs'   "autocompletado de llaves, corchetes, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Syntax autocompletion.
Plug 'preservim/nerdtree' "Tree of files to be used

call plug#end()       "cerramos el llamado de los plugins

set termguicolors
colorscheme gruvbox    

" AUTOCOMPLETE CONFIGURATION

let g:coc_global_extensions = ['coc-tsserver', 
  \ 'coc-json', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-python', 
  \ 'coc-sh', 
  \ 'coc-go', 
  \ 'coc-vimlsp', 
  \ 'coc-java', 
  \ 'coc-rust-analyzer', 
  \ 'coc-lua', 
  \ 'coc-clangd', 
  \ 'coc-markdownlint', 
  \ 'coc-phpactor', 
  \ 'coc-git',
  \ 'coc-prettier']
inoremap <silent><expr> <C-n> coc#refresh()
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" AIRLINE CONFIGURATION

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
