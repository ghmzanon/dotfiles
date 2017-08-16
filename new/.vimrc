" Vundle ##############################################################

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

" Plugins config #######################################################

" base16 colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  source ~/.vimrc_background
endif

" Main config ##########################################################

" enable syntax highlight
syntax on

" enable statusbar
set laststatus=2

" enable autocomplete menu
set wildmenu

" enable mouse support
set mouse=a

" enable specified column highlight
set colorcolumn=72
" enable current line highlight
set cursorline
" enable line numbers
set number
" enable line numbers relative to current line
set relativenumber

" highlight matched search string
set hlsearch
" disable search wrap around
set nowrapscan
" move the cursor to the matched string while typing the search 
set incsearch
" case insensitive search
" set ignorecase

" enable autoindentation
set autoindent
" enable tab to spaces conversion
set expandtab
" set indentation width
set shiftwidth=3
" set tab width
set softtabstop=3

" define white space caracters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•

" Status bar ##########################################################

" path of the file
set statusline=%F\
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

" Functions ###########################################################

function! ToggleNumber()
    set rnu!
endfunction

function! ToggleWhiteSpaces()
    set list!
endfunction

function! ToggleColorColumn()
   if &colorcolumn != 0
      set colorcolumn=0
   else
      set colorcolumn=72
   endif
endfunction

" Keybindings #########################################################

noremap <silent><F2> :NERDTreeToggle<CR>
noremap <silent><F3> :call ToggleNumber()<CR>
noremap <silent><F4> :call ToggleColorColumn()<CR>
noremap <silent><F5> :call ToggleWhiteSpaces()<CR>
