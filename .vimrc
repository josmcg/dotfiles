colorscheme japanesque
filetype off                  " required
syntax on "turn on syntax for all files, decreases performance
set smartcase
"I can't do tons of indentationn
set tabstop=2
set shiftwidth=2
inoremap <BS> <Left><Del>
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug '~/.vim/proselint', {'for' : 'markdown'}
call plug#end()
augroup default
	autocmd!
augroup END

filetype plugin indent on
set laststatus=2
set number
set cursorline
set incsearch
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = '/usr/local/Cellar/tidy-html5/5.1.25'
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_js_checkers = ['jshint']
let g:syntastic_markdown_checkers = ['proselint']
let g:syntastic_mode_map = {
			\"mode": "passive",
			\"active_filetypes":["python","markdown","javacript"],
			\"passive_filetypes":[]}
let NERDTreeShowHidden=1 "show dotfiles by default
"airline settings
let g:git_branch = substitute(system('git symbolic-ref HEAD --short'),"^@", "","")
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_extensions = [] 
"function! AirlineInit(...)
"	let w:airline_section_b = '%f'
"	"let w:airline_section_c = g:git_branch
"	let g:airline_section_d = ''
"endfunction
"call airline#add_statusline_func('AirlineInit')

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let mapleader = ' '
nmap <leader>f <C-w>w
nmap <leader>n :tabn<CR>
nmap <leader>t :tabedit
nmap <leader><space> i<space><esc>
nmap <leader><CR> o<esc>
nmap <leader>c :tabclose<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>q :wqa<CR>
nmap <leader>sc :call SyntasticCheck()
nmap <leader>s :w<CR>
nmap <leader>, :bprev<CR>
nmap <leader>. :bnext<CR>
"remaps
nnoremap <tab> %
"most important command here
command W w
"useful commands
command PrettyJSON %!python -m json.tool
