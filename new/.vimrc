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

" Plugins configurations ##############################################

" base16 colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  source ~/.vimrc_background
endif

" Status bar ##########################################################

" enable status bar
set laststatus=2
" path of the file
set statusline=%F\
" help file flag
set statusline+=%h           
set statusline+=%m           "modified flag
set statusline+=%r           "read only flag
set statusline+=\ %y         "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding
set statusline+=[%{&ff}]     "file format
set statusline+=%=           "left/right separator
set statusline+=%c,          "cursor column
set statusline+=%l/%L        "cursor line/total lines
set statusline+=\ %P         "percent through file

" #####################################################################

" enable syntax highlight
syntax on
set colorcolumn=72
set cursorline
set ruler
set number
set relativenumber
set wildmenu
set mouse=a

" Functions ###########################################################

function! ToggleNumber()
    set rnu!
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
