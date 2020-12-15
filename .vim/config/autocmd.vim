""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommand
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Place cursor in its last edit position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

" Remove all trailling whitespaces before writing files
autocmd BufWritePre * %s/\s\+$//e