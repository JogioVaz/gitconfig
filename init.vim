set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set splitright
set ma

"Aquí es donde se instalan los plugins y temas
call plug#begin('~/.vim/plugged')

"Variable para configuracion de CoC
let g:coc_config_home = '~/.vim/cocConfig'

" Temas 
Plug 'drewtempelmeyer/palenight.vim'

" IDE
Plug 'mattn/emmet-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --forzen-lockfile' }
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
call plug#end()

" MAPEO DE TECLAS
" Tecla líder
let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"Mapeo tecla salir terminal
:tnoremap ,, <C-\><C-n>

"Salir del modo insertar
:imap ,, <Esc>

"Aplicar emmet
:imap <A-E> <C-Y>,

"Alt + jk para ir arriba o abajo en lugar de las flechas
:imap <A-j> <Down>
:imap <A-k> <Up>

"c + espacio en modo normal para borrar a partir del cursor
nmap c<Leader> c$

" Easymotion
nmap <Leader>s <Plug>(easymotion-s2)

"NerdTree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

noremap <leader>gs :CocSearch
nmap <leader>fs :FZF<CR>
nmap <leader>rg :Rg<CR>

"Crear una nueva terminal en la parte de abajo
function Ter(...)

  :echo a:1
  
  :sp "\<CR>"
  
  :execute "normal \<C-J>"
  ":wincmd w - Esto es lo mismo que la linea de arriba
  
  :resize 7 "\<CR>"
  :set eadirection=hor
  "if empty(a:1)
  " echo "Estas en: "
  " echo expand("%")
  "endif

  :term
  :normal i
 
endfunction

command! -nargs=* Ter :call Ter(<q-args>)



" THIS IS COLOR AND TEXT CONFIGURATION!!
set background=dark
colorscheme palenight
" Configure lightline
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif
" Activar las italicas
let g:palenight_terminal_italics=1
"Overriding colors
let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'


"comandos a utilizar despues de usar el :PlugInstall
":CocConfig
":CocInstall coc-svelte
