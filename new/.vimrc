"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible   " be iMproved, required
filetype off       " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " tree explorer
   Plugin 'scrooloose/nerdtree'
   " file-type sensible comments
   Plugin 'tomtom/tcomment_vim'
   " base16 colors
   Plugin 'chriskempson/base16-vim'
call vundle#end()            " required

filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " base16 colors
   if filereadable(expand("~/.vimrc_background"))
     let base16colorspace = 256
     source ~/.vimrc_background
   endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Autocommand
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " autostart nerdtree
   " au VimEnter * NERDTree
   " place cursor in its last edit position when opening files
   au BufReadPost * call RestoreCursor()
   " remove trailling white spaces before writing files
   au BufWritePre * call RemoveTrailingSpaces()


   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " General
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " enable syntax highlighting
   syntax on
   " enable autocomplete menu
   set wildmenu
   " enable mouse support
   set mouse=a
   " set utf8 as standard encoding
   set encoding=utf8
   " use unix as the standard file type
   set ffs=unix,dos,mac
   " avoid redraw while executing macros
   set lazyredraw
   " enable auto read when a file is changed from the outside
   set autoread

   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " File backups
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " disable backup
   set nobackup
   " avoid creating a swap file
   set noswapfile

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Orientation
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " highlight specified column
   set colorcolumn=72
   " enable current line highlighting
   set cursorline
   " enable line numbers
   set number
   " enable line numbers relative to current line
   set relativenumber

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Search
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " highlight matched search string
   set hlsearch
   " disable search wrap around
   set nowrapscan
   " move the cursor to the matched string while typing the search
   set incsearch
   " case insensitive search
   " set ignorecase
   " show matching brackets when cursor is over them
   set showmatch


   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Indentation
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " enable autoindentation
   set autoindent
   " enable tab to spaces conversion
   set expandtab
   " set indentation width
   set shiftwidth=3
   " set tab width
   set softtabstop=3


   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Folding
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " folding based on indentation
   set foldmethod=indent
   " limit nested folding
   set foldnestmax=3
   " disable automatic folding
   set nofoldenable

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " White spaces visibility
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " define white space caracters
   set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:⋅
   " enable white space visibility
   set list

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Status bar
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " enable statusbar
   set laststatus=2
   " path of the file
   set statusline=%F
   " help file flag
   set statusline+=%h
   " modified flag
   set statusline+=%m
   " read only flag
   set statusline+=%r
   " filetype
   set statusline+=\ %y
   " file encoding
   set statusline+=[%{strlen(&fenc)?&fenc:'none'}]
   " file format
   set statusline+=[%{&ff}]
   " left/right separator
   set statusline+=%=
   " cursor column
   set statusline+=%c,
   " cursor line/total lines
   set statusline+=%l/%L
   " percent through file
   set statusline+=\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " place cursor in its last edit position
   fun! RestoreCursor()
      if line("'\"") <= line("$")
         normal! g`"
         return 1
      endif
   endfun

   " remove trailing white space on save
   fun! RemoveTrailingSpaces()
       let save_cursor = getpos(".")
       let old_query = getreg('/')
       silent! %s/\s\+$//e
       call setpos('.', save_cursor)
       call setreg('/', old_query)
   endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Keyboard shortcuts
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " toogle nerdtree pane
   noremap <silent><F2> :NERDTreeToggle<CR>
   " toogle relative number
   noremap <silent><F3> :set rnu!<CR>
   " toogle white spaces visibility
   noremap <silent><F4> :set list!<CR>
   " use vim-shortcuts to move between windows
   map <C-h> <C-W>h
   map <C-j> <C-W>j
   map <C-k> <C-W>k
   map <C-l> <C-W>l
    " force writing files with root privileges
   command W w !sudo tee % > /dev/null
