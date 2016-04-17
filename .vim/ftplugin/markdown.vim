setlocal textwidth=80
setlocal formatoptions=ant
setlocal spell spelllang=en_us
setlocal wrapmargin=0
augroup group
	autocmd! 
	autocmd BufWritePost *.md call MarkdownCompile()
	autocmd BufNewFile,VimEnter   *.md call InsertDefaultYAML()
augroup END

function! MarkdownCompile()
	"compile markdown to pdf with pandoc by default
	"check if a .sty file exists
	if !empty(glob(expand("%:r.sty")))
		:!pandoc -H %:r.sty % -s -o %:r.pdf
		return 1
	endif
	"file doesn't exist, try a default
	if !empty(glob("~/.vim/templates/pandoc.sty"))
		:!pandoc -H ~/.vim/templates/pandoc.sty % -s -o %:r.pdf
		return 1
	endif

	"neither exist, just compile
	 :!pandoc % -s -o %:r.pdf 
	 return 1
endfunction

function! InsertDefaultYAML()
	if empty(glob(expand("%")))
		if !empty(glob("~/.vim/templates/pandoc.yaml"))
			execute "r ~/.vim/templates/pandoc.yaml"	
		else
			echom("no default yaml file, consider making one and putting it at ~/.vim/templates/pandoc.yaml")
		endif
	endif
endfunction

