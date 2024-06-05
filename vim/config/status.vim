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
