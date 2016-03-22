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

hi Normal 		term=NONE      cterm=NONE      ctermfg=253 ctermbg=232

" Dark grays
hi Comment		term=NONE      cterm=NONE      ctermfg=102
hi CursorColumn	term=NONE      cterm=NONE      ctermbg=234
hi CursorLine	term=NONE      cterm=NONE      ctermbg=234
hi LineNr		term=NONE      cterm=NONE      ctermfg=236

" Blues
hi Identifier	term=NONE      cterm=NONE      ctermfg=81

" Greens and yellow-greens
hi Constant		term=NONE      cterm=NONE      ctermfg=120
hi String		term=NONE      cterm=NONE      ctermfg=119

" Oranges
hi Operator		term=NONE      cterm=NONE      ctermfg=180
hi Statement	term=NONE      cterm=NONE      ctermfg=179

" Purples
hi Special		term=NONE      cterm=NONE      ctermfg=201
hi PreProc		term=NONE      cterm=NONE      ctermfg=201

hi SpecialKey	term=NONE      cterm=NONE      ctermfg=103
hi NonText		term=NONE      cterm=NONE      ctermfg=103

hi Type			term=NONE      cterm=NONE      ctermfg=103

hi Underlined	term=underline cterm=underline ctermfg=5
hi Ignore		term=NONE      cterm=NONE      ctermfg=15
hi Error		term=underline cterm=underline ctermfg=1 ctermbg=none
hi Todo			term=standout  cterm=standout  ctermfg=0 ctermbg=11
