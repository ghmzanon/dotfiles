""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" References:
"
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible   " be iMproved, required
filetype off       " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " File Explorer
   Plugin 'scrooloose/nerdtree'

   " File-type sensible comments
   Plugin 'tomtom/tcomment_vim'

call vundle#end()            " required

filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" None

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File I/O
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding
set encoding=utf8

" Use UNIX as the standard file type
set ffs=unix,dos,mac

" Auto read when a file is changed from the outside
set autoread

" Turn backup off
set nobackup
set nowb

" Do not create swap files
set noswapfile

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Always show current position
set ruler

" Display line numbers
set number

" Display preferred column limit
set colorcolumn=80

" Highlight current line
set cursorline

" Set invisible char symbols
set listchars=eol:¬,tab:>-,trail:~,space:·

" Turn on the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Enable status line
set laststatus=2

" Enable mouse support
set mouse=a

" No error sounds
set noerrorbells
set novisualbell

" Disable latex symbol conversion
let g:tex_conceal=""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent
set autoindent

" Smart indent
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Disable search wrap around
set nowrapscan

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Path of the file
set statusline=%F

" Modified flag
set statusline+=%m

" Read only flag
set statusline+=%r

" Filetype
set statusline+=\ %y

" File encoding
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]

" File format
set statusline+=[%{&ff}]

" Left/right separator
set statusline+=%=

" Cursor column
set statusline+=%c,

" Cursor line/total lines
set statusline+=%l/%L

" Percent through file
set statusline+=\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Place cursor in its last edit position
function! RestoreCursor()
   if line("'\"") <= line("$")
      normal! g`"
      return 1
   endif
endfunction

" Remove trailing white space on save
function! RemoveTrailingSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

function! ToggleColorColumn()
   if &colorcolumn != 0
      set colorcolumn=0
   else
      set colorcolumn=80
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommand
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autostart nerdtree
" au VimEnter * NERDTree

" Place cursor in its last edit position when opening files
au BufReadPost * call RestoreCursor()

" Remove trailling white spaces before writing files
au BufWritePre * call RemoveTrailingSpaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle NerdTree file explorer
noremap <silent><F2> :NERDTreeToggle<CR>

" Toggle invisible chars
map <silent><F3> :set list!<CR>

" Toggle relative number
map <silent><F4> :set relativenumber!<CR>

" Toggle color column
map <silent><F5> :call ToggleColorColumn()<CR>

" Ignore common typos
command WQ wq
command Wq wq
command Q q

" Use vim-shortcuts to move between windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Forced use of hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" (Un)Folding with spacebar
nnoremap <Space> za
vnoremap <Space> za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
