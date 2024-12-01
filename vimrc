 " Basic Configurations --------------------------------------------------------

set autoread		" autoread file's external change
set nocompatible    " won't be compatible with vi
filetype plugin indent on
set syntax=on		" language highlight

" Display Configurations -------------------------------------------------------

set number		" show line number
set ruler		" always display the posiition of cursor
set showcmd		" show command in the bottom bar
set mouse=i		" only suppport mouse in insert mode
set showmatch		" show match parenthesis
set cursorline		" highlight current line
set laststatus=2	" always show status bar
set colorcolumn=81	" show 80 characters line
set textwidth=80

" open file at the position of last close
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set clipboard=unnamedplus

" File Configurations ----------------------------------------------------------

set nobackup		" No backup
set noswapfile		" No swap file

" Encoding Configurations ------------------------------------------------------

set fileencodings=utf-8,gb2312,gbk,gb18030,cp936
" set fileencoding=utf-8      " the encoding of saved file
set termencoding=utf-8      " the encoding of terminal
set encoding=utf-8          " the encoding of opened file

" Clipboard Configurations -----------------------------------------------------

set clipboard=unnamedplus

" Tab-Width Configurations -----------------------------------------------------

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftwidth=4

" Keymap Configurations --------------------------------------------------------

"" leader
let mapleader = ","

"" esc
inoremap ui <ESC>

"" operations of .vimrc
nmap <silent> <F1> :so ~/.vimrc<CR>
nmap <silent> <F12> :vsplit ~/.vimrc<CR>

"" big move and enter insert mode
nmap H ^i
nmap L $a

"" write as admin
cmap sudow w !sudo tee > /dev/null %

"" select all
map <C-A> ggVG

"" save file in traitional way
map <C-S> :w<CR>

"" copy line
nnoremap ck yykp
nnoremap cj yyp

"" move line
nnoremap mk ddkkp
nnoremap mj ddp

"" tab management
map <leader>to :tabo<CR>
map <leader>tc :tabc<CR>
map <leader>tp :tabp<CR>
map <leader>tn :tabn<CR>

"" buffer management
map <leader>bl :ls<CR>
map <leader>bo :enew<CR>
map <leader>bc :bdelete<CR>
map <leader>bp :bprevious<CR>
map <leader>bn :bnext<CR>

"" wrap
nnoremap <F3> :set wrap!<CR>

"" syntax highlight
nnoremap <F3> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Plugin Configurations --------------------------------------------------------

"" Vim-Plug auto install
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" other plugins auto install
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" start vim-plug
call plug#begin()

"" Plugin [NeoDark]
Plug 'KeitaNakamura/neodark.vim' " vim-plug
set termguicolors                " recommended


"" Plugin [Rainbow_Parentheses]
Plug 'kien/rainbow_parentheses.vim'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"" Plugin [EasyMotion]
Plug 'easymotion/vim-easymotion'
nmap <leader>s <Plug>(easymotion-s)


"" Plugin [NERD_Commenter]
Plug 'preservim/nerdcommenter'

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'right'
let g:NERDCommentEmptyLines = 1
let g:NERDTreeHidden=0
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let g:NERDTrimTrailingWhitespace = 1


"" Plugin [Airline]
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

"" Plugin [Vim-Smooth-Scroll]
Plug 'terryma/vim-smooth-scroll'

noremap <silent> K :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> J :call smooth_scroll#down(&scroll, 20, 2)<CR>


"" Plugin [NerdTree]
Plug 'preservim/nerdtree'
nnoremap <leader>ntc :NERDTreeFocus<CR>
nnoremap <leader>ntt :NERDTree<CR>
nnoremap <leader>ntg :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>

nnoremap <F2> :NERDTreeToggle<CR>

"" Plugin [Vim-DevIcons]
" Plug 'ryanoasis/vim-devicons'

"" stop vim-plug
call plug#end()
filetype plugin on
syntax on

" Set colorscheme for Vim
colorscheme neodark

