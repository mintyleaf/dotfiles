set nu
set ruler
set hls
nnoremap <enter> :noh<return><enter>
syntax on
set listchars=eol:$,tab:>\ 
set list
set tabstop=4
set shiftwidth=4
set autoindent
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_confirm_extra_conf = 0
nnoremap f :F<CR>
let g:fff#split = "45vnew"
let g:fff#split_direction = "nosplitbelow nosplitright"
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

call plug#begin('~/.vim/plugged')

" Using plug
Plug 'dylanaraps/wal.vim'
Plug 'dylanaraps/fff.vim'
Plug 'bling/vim-bufferline'

call plug#end()

colorscheme wal
