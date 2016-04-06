setlocal foldcolumn=10
setlocal textwidth=80
setlocal columns=100
colorscheme off
setlocal nonumber 
setlocal nocursorline
"autocmd BufWritePost * :!pandoc %:t --latex-engine=xelatex -s -o %:t:r.pdf
