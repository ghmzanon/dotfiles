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
" Text format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent
set autoindent

" Smart indent
set smartindent

" Set preferred text width
set textwidth=80

" Let vim hard wrap lines based on text width
set formatoptions+=t

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
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme elflord

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
