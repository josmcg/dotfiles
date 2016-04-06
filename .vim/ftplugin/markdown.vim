setlocal foldcolumn=10
setlocal columns=100
setlocal textwidth=80
setlocal nonumber 
setlocal nocursorline

augroup group
	autocmd! "clear autocommand group
	autocmd VimEnter * :colorscheme off
	autocmd BufWritePost * :!pandoc -H %:t:r.sty  %:t -s -o %:t:r.pdf
augroup END
