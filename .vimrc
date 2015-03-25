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
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'amdt/vim-niji'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
autocmd BufNewFile,BufRead *.json set ft=javascript " highlight JSON
colorscheme apprentice " must appear *after* enabling syntax highlighting

set colorcolumn=80
set cursorline
set hlsearch
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nowrap
set relativenumber

" Custom key bindings
let mapleader="\<Space>"

nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :wq<CR>

nmap ` :CtrlPMRU<CR>
nmap 1 _
nmap 9 g_
nmap <Tab> :set hlsearch!<CR>

nmap <Leader><Tab> :set list!<CR>
nmap <Leader><Leader> :FixWhitespace<CR>
nmap <Leader>f :Ag<Space>
map <Leader>k :NERDTreeToggle<CR>
nmap <Leader>p :vsplit<CR>
nmap <Leader>t :tabnew<CR>

" Plugin Ctrl-P
let g:ctrlp_show_hidden=1
let g:ctrlp_match_window='order:ttb'
let g:ctrlp_custom_ignore='node_modules'

" Plugin NERDTree
let g:NERDTreeShowHidden=1

" Plugin NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1

" Plugin neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1 " for vim-clojure-static
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always=1
