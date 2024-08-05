"""""""""""""""""""" Basic """""""""""""""""""""""""""""""""""
set autoread        " autoread file's external change
set filetype=on		" detect filetype
filetype plugin indent on
set syntax=on		" Language highlight

"""""""""""""""""""" Display """"""""""""""""""""""""""""""""
set number		    " show line numberr
set ruler           " always display the position of cursor
set showcmd		    " show command in the bottom bar
set mouse=i         " only suppport mouse in insert mode
set textwidth=80
set showmatch		" show match parenthesis

"""""""""""""""""""" File """""""""""""""""""""""""""""""""""

set nobackup		" No backup
set noswapfile		" No swap file

"""""""""""""""""""" Search """"""""""""""""""""""""""""""""""
set hlsearch        " highlight search result
set ignorecase      " ignore case when searching
set incsearch       " search when inserting text
set smartcase       " ignore case except for giving a upper case letter

""""""""""""""""""""  Tab   """"""""""""""""""""""""""""""""""
set autoindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"""""""""""""""""""" Encoding """"""""""""""""""""""""""""""""
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936
set fileencoding=utf-8      " the encoding of saved file
set termencoding=utf-8      " the encoding of terminal
set encoding=utf-8          " the encoding of opened file


""""""""""""""""""" Custom Command """""""""""""""""""""""""""
" Leader

let mapleader = ","

" ESC
inoremap ii <Esc>

" write as superuser when it's not
cmap sudow w !sudo tee > /dev/null % 

" Select all 
map <C-A> ggVG

" Copy and Paste
nnoremap ck yypk    " copy line up
nnoremap cj yyp     " copy line down
nmap <C-p> "+p      " paste the content in system clipboard
vmap <C-y> "+y      " copy the selected content in system clipboard

" Auto Complete
:inoremap ( ()<ESC>i
:inoremap ' ''<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
