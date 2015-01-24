" Vundle required settings
set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
set number
set relativenumber

" Custom key bindings
" map <C-n> :NERDTreeToggle<CR>
map <C-k> <plug>NERDTreeTabsToggle<CR>

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn
highlight link GitGutterAdd SignColumn
highlight link GitGutterChange SignColumn
highlight link GitGutterDelete SignColumn

" Plugin NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1

