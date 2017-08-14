"""""""""" Vundle plugins """"""""""
set nocompatible   " be iMproved, required
filetype off       " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomtom/tcomment_vim'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()            " required
filetype plugin indent on    " required


"""""""""" Eye-candy """"""""""
syntax on
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-monokai
set background=dark

"""""""""" Orientation """"""""""
set ruler
set number
set relativenumber

function! ToggleNumber()
   set rnu!
endfunction

"""""""""" Colorcolumn """"""""""
set colorcolumn=0
" hi colorcolumn ctermbg=red "defines column color

function! ToggleColorColumn()
   if &colorcolumn != 0
      set colorcolumn=0
   else
      set colorcolumn=80
   endif
endfunction

"""""""""" Search """"""""""
set hlsearch
set showmatch
set incsearch

"""""""""" Tab spacing and identation """"""""""
set expandtab
set shiftwidth=3
set tabstop=3
set autoindent

"""""""""" Folding """"""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"""""""""" Autocompletion """"""""""
set wildmenu

"""""""""" Mouse support """"""""""
set mouse=a

"""""""""" Common typos """"""""""
command WQ wq
command Wq wq
command W w
command Q q

"""""""""" Trailing """"""""""
hi ExtraWhitespace ctermbg=darkred   "highlight group and color
match ExtraWhitespace /\s\+$/        "shows trailing whitespace

"""""" Fixes """"""
""" Latex math symbols
let g:tex_conceal = ""
""" Matched parenthesis color with base16
hi MatchParen cterm=none ctermbg=white ctermfg=black

"""""""""" Shortcuts """"""""""
noremap <silent><F2> :NERDTreeTabsToggle<CR>
noremap <silent><F3> :IndentLinesToggle<CR>
noremap <silent><F4> :call ToggleNumber()<CR>
noremap <silent><F5> :call ToggleColorColumn()<CR>

"""""""""" Status bar """"""""""
set laststatus=2             "enables status bar
set statusline=%F\           "path of the file
set statusline+=%h           "help file flag
set statusline+=%m           "modified flag
set statusline+=%r           "read only flag
set statusline+=\ %y         "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] "file encoding
set statusline+=[%{&ff}]     "file format
set statusline+=%=           "left/right separator
set statusline+=%c,          "cursor column
set statusline+=%l/%L        "cursor line/total lines
set statusline+=\ %P         "percent through file

"""""""""" Plugins config """""""""
""" indent-lines """""
" let g:indentLine_enabled = 0
" let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
