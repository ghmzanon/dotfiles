""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open terminal vertically
noremap <silent> <C-a> :vert ter <CR>

" Toggle NerdTree file explorer
noremap <silent> <C-b> :NERDTreeToggle <CR>

" Toggle invisible chars
noremap <silent> <F2> :set list! <CR>

" Toggle relative number
noremap <silent> <F3> :set relativenumber! <CR>

" Toggle spell check
noremap <silent> <F4> :set spell! spelllang=pt-br <CR>

" Toggle folding with spacebar
noremap <Space> za

" Use Ctrl+{h,j,k,l} to move between split buffers
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Forced use of hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Ignore common typos
command WQ wq
command Wq wq
command Q q