" Vundle required settings
set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplcache.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-repeat'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'

call vundle#end()

filetype plugin indent on

" Vim settings
syntax enable
autocmd BufNewFile,BufRead *.json set ft=javascript " highlight JSON
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS
colorscheme zenburn " must appear *after* enabling syntax highlighting

set backspace=2 " the default OS X and Linux(?) vimrc files do this anyway
set colorcolumn=80
set cursorline
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nowrap
set number
set ttimeoutlen=0 " same as MacVim; updates powerline immediately on Escape

" Custom key bindings
let mapleader="\<Space>"

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>w :w<CR>

nmap ,, :tabnew ~/.files/.vimrc<CR>
nmap <Leader>` :CtrlPBuffer<CR>
nmap <S-Tab> <C-o>

nmap <Leader><Tab> :set list! list?<CR>
nmap <Leader>- :StripWhitespace<CR>
nmap <Leader>/ :nohlsearch<CR>

nnoremap <Leader>{ :tabprevious<CR>
nnoremap <Leader>} :tabnext<CR>
nnoremap <Leader>L <C-w>l
nnoremap <Leader>H <C-w>h
nnoremap <Leader>J <C-w>j
nnoremap <Leader>K <C-w>k

map <Leader>c :checktime<CR>
nmap <Leader>f :Ag<Space>
map <Leader>gb :Gblame<CR>
map <Leader>gm :Gmove
map <Leader>k :NERDTreeToggle<CR>
map <Leader>l :NERDTreeFind<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader>r :%s/
nmap <Leader>sl :colorscheme summerfruit256<CR>
nmap <Leader>sd :colorscheme zenburn<CR>
nmap <Leader>t :tabnew<CR>

" Plugin airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 79,
  \ 'x': 60,
  \ 'y': 88,
  \ 'z': 80,
  \ }

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

" Plugin rainbow_parentheses
au BufEnter *.clj RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

" Plugin Syntastic
" -- recommended settings (from help)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0

" -- filetype-specific settings
let g:syntastic_javascript_checkers = ['eslint']

" Plugin vim-gitgutter
let g:gitgutter_sign_column_always=1
