" Basic Configurations -------------------------------------------------------

set autoread		" autoread file's external change
set nocompatible
filetype plugin indent on
set syntax=on		" language highlight
set filetype=off	" detect filetype

" Display Configurations -----------------------------------------------------

set number		" show line number
set ruler		" always display the posiition of cursor
set showcmd		" show command in the bottom bar
set mouse=i		" only suppport mouse in insert mode
set textwidth=80
set showmatch		" show match parenthesis
set cursorline		" highlight current line
set laststatus=2	" always show status bar

" open file at the position of last close
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" File Configurations --------------------------------------------------------

set nobackup		" No backup
set noswapfile		" No swap file

" Encoding Configurations ----------------------------------------------------

set fileencodings=utf-8,gb2312,gbk,gb18030,cp936
set fileencoding=utf-8      " the encoding of saved file
set termencoding=utf-8      " the encoding of terminal
set encoding=utf-8          " the encoding of opened file

" Keymap Configurations ------------------------------------------------------
"
" leader
let mapleader = ","

" esc
inoremap uu <ESC>

" reload .vimrc
nmap <leader>vr :source ~/.vimrc<CR>

" big move
nmap H ^i
nmap L $a

" write as admin
cmap sudow w !sudo tee > /dev/null %

" select all
map <C-A> ggVG

" save file in traditional way
map <C-S> :w<CR>

" copy line
nnoremap ck yykp
nnoremap cj yyp

" move line
nnoremap mk ddkkp
nnoremap mj ddp

" tab management
map <leader>tc :tabc<CR>
map <leader>to :tabo<CR>
map <leader>tp :tabp<CR>
map <leader>tn :tabn<CR>

" Plugin Configurations ------------------------------------------------------
"
" plugin auto-installation
"
" Vim-Plug auto install
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Other plugins auto install
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" start vim-plug
call plug#begin()

" Plugin [NeoDark]
Plug 'KeitaNakamura/neodark.vim' " vim-plug
set termguicolors                " recommended

" Plugin [Airline]
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme="angr"              " Theme 
let g:airline_powerline_fonts = 1       " Font 
let g:airline_colorscheme = 'neodark'

let g:airline#extensions#tabline#enabled = 1        " Tabline Support
let g:airline#extensions#tabline#buffer_nr_show = 1 " Tabline buffer show
let g:airline#extensions#whitespace#enabled = 0     " show whitespace
let g:airline#extensions#whitespace#symbol = '!'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Plugin [NerdTree]
Plug 'preservim/nerdtree'
nnoremap <leader>ntc :NERDTreeFocus<CR>
nnoremap <leader>ntt :NERDTree<CR>
nnoremap <leader>ntg :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>

" stop vim-plug
call plug#end()

" Set colorscheme for Vim
colorscheme neodark

