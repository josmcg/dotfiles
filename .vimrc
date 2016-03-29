colorscheme brogrammer
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on "turn on syntax for all files, decreases performance
set smartcase
set rtp+=~/.vim/bundle/Vundle.vim
inoremap <BS> <Left><Del>
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'reedes/vim-pencil'
call vundle#end()
filetype plugin indent on
set laststatus=2
set number
set cursorline
set undofile
set undodir=~/.vim/undo
set undolevels=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = '/usr/local/Cellar/tidy-html5/5.1.25'
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_js_checkers = ['jshint']
let g:syntastic_mode_map = {
			\"mode": "passive",
			\"active_filetypes":["python"],
			\"passive_filetypes":[]}
"start nerdtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1 "show dotfiles by default
"airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_extensions = [] 
function! AirlineInit(...)
	let w:airline_section_b = '%f'
	let w:airline_section_c = 'Focus'
	let g:airline_section_d = '%{PencilMode()}'
endfunction
call airline#add_statusline_func('AirlineInit')
let g:pencil#autoformat = 1 
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
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
nmap <leader>/ :!.proj.sh<CR>
nmap <leader>s :w<CR>
"remaps
nnoremap <tab> %
