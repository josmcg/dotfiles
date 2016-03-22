" Vim color file
" Maintainer:	Matt Gray <matt@clockwork.net>

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name = "clockwork"
hi Normal 		term=NONE      cterm=NONE      ctermfg=253 ctermbg=0
hi Comment		term=NONE      cterm=NONE      ctermfg=59
hi Constant		term=NONE      cterm=NONE      ctermfg=77
hi CursorColumn	term=NONE      cterm=NONE      ctermbg=234
hi CursorLine	term=NONE      cterm=NONE      ctermbg=234
hi LineNr		term=NONE      cterm=NONE      ctermfg=236
hi Special		term=NONE      cterm=NONE      ctermfg=170
hi SpecialKey	term=NONE      cterm=NONE      ctermfg=60
hi NonText		term=NONE      cterm=NONE      ctermfg=60
hi Identifier	term=NONE      cterm=NONE      ctermfg=80
hi Statement	term=NONE      cterm=NONE      ctermfg=180
hi PreProc		term=NONE      cterm=NONE      ctermfg=170
hi Type			term=NONE      cterm=NONE      ctermfg=109
hi Underlined	term=underline cterm=underline ctermfg=5
hi Ignore		term=NONE      cterm=NONE      ctermfg=15
hi Error		term=underline cterm=underline ctermfg=1 ctermbg=none
hi Todo			term=standout  cterm=standout  ctermfg=0 ctermbg=11
