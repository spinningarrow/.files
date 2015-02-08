" Theme
set background=dark
colorscheme Tomorrow-Night-Eighties

" Editor size
set lines=42 columns=120

" Typography
set guifont=InputMonoCompressed\ Thin:h13
"set linespace=2

" Plugin vim-gitgutter (copied from .vimrc
" because for some reason MacVim doesn't
" like to read the GitGutter settings from
" there)
let g:gitgutter_sign_column_always=1
highlight clear SignColumn
highlight link GitGutterAdd SignColumn
highlight link GitGutterChange SignColumn
highlight link GitGutterDelete SignColumn
