call plug#begin('~/AppData/Local/nvim/plugged') "Ruta donde se guardaran los plugins windows
"call plug#begin('~/.config/nvim/plugged') "Ruta donde se guardaran los plugins linux

"Plugin temas
Plug 'sainnhe/gruvbox-material' "GRUVBOX
Plug 'catppuccin/nvim', {'as': 'catppuccin'} "CATPPUCCIN
Plug 'dracula/vim', { 'as': 'dracula' } "DRACULA
Plug 'rakr/vim-one' "VIM ONE

"Plugins para autocompletado
Plug 'neovim/nvim-lspconfig' "Deteccion de los lenguajes (LSP)
Plug 'nvim-lua/completion-nvim' "Autocompletado de lenguajes
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} "Recuadro para las sugerencias del autocompletado

"Plugins para JavaScript
Plug 'pangloss/vim-javascript' "Resaltado con colores de sintaxis javascript
Plug 'maxmellon/vim-jsx-pretty' "Resaltado con colores de etiquetas html en reactJs

"Plugins para snippets de javascript, reactJs
Plug 'mlaursen/vim-react-snippets'

"Plugins para html
Plug 'mattn/emmet-vim' "Snippets para crear etiquetas html
Plug 'alvan/vim-closetag' "Autocompletado de etiquetas html

"Plugin comentarios
Plug 'terrortylor/nvim-comment'

"Plugin de barra de estado"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "Temas de la barra de estado

"Plugin de gestor de archivos
Plug 'scrooloose/nerdtree'

"Plugin de autocompletado de llaves
"Plug 'jiangmiao/auto-pairs'

"Plugin de fuentes
Plug 'ryanoasis/vim-devicons'

"Plugin de vista previa de colores
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Plugin de identacion
Plug 'lukas-reineke/indent-blankline.nvim'

"Plugin Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'kyazdani42/nvim-web-devicons'


call plug#end()
