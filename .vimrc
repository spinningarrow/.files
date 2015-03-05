" Vundle required settings
set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
colorscheme Monokai " must appear *after* enabling syntax highlighting

set colorcolumn=80
set cursorline
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nowrap
set number
set relativenumber

" Custom key bindings
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
nmap <Leader>v :vsplit<CR>
nmap <Leader><Leader> V
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprev<CR>
nmap <Leader><Tab> :FixWhitespace<CR>
map <C-k> <plug>NERDTreeTabsToggle<CR>

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always=1

" Plugin Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules'
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-t>'],
"     \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"     \ }

" Plugin neocomplcache
let g:neocomplcache_enable_at_startup=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin NERDTree
let g:NERDTreeShowHidden=1

" Plugin NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1

