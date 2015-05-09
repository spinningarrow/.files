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
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'spinningarrow/vim-niji'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
autocmd BufNewFile,BufRead *.json set ft=javascript " highlight JSON
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS
colorscheme apprentice " must appear *after* enabling syntax highlighting

set backspace=2 " the default OS X and Linux? vimrc files do this anyway
set colorcolumn=80
set cursorline
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nowrap
set relativenumber

" Custom key bindings
let mapleader="\<Space>"

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>w :w<CR>

nmap ,, :tabnew ~/.files/.vimrc<CR>
nmap <Leader>` :CtrlPBuffer<CR>
nmap g1 _
nmap g9 g_
nmap <S-Tab> <C-o>

nmap <Leader><Tab><Tab> :set list! list?<CR>
nmap <Leader><Tab><Space> :StripWhitespace<CR>
nmap <Leader><Tab>/ :nohlsearch<CR>

nmap <Leader>f :Ag<Space>
map <Leader>k :NERDTreeToggle<CR>
map <Leader>l :NERDTreeFind<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader>r :%s/
nmap <Leader>t :tabnew<CR>

" Plugin Ctrl-P
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" Plugin NERDTree
let g:NERDTreeShowHidden=1

" Plugin NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1

" Plugin neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1 " for vim-clojure-static
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin Syntastic
" Syntastic: recommended settings (from help)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" Syntastic: filetype-specific settings
let g:syntastic_javascript_checkers = ['eslint']

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always=1
