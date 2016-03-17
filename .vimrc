set nocompatible              " be iMproved, required
filetype off                  " required
syntax on "turn on syntax for all files, decreases performance
set smartcase
set rtp+=~/.vim/bundle/Vundle.vim
inoremap <BS> <Left><Del>
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
imap cs :call SyntasticCheck()
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
map <C-n> :NERDTreeToggle<CR>
map <C-t> :tabn <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <space> i<space><esc>
