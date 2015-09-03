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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-repeat'
Plugin 'chrisbra/Replay'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'

call vundle#end()

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" Syntax
syntax enable
autocmd BufNewFile,BufRead *.json set ft=javascript " highlight JSON
autocmd BufNewFile,BufRead *.fish set ft=sh " highlight Fish files
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS

" Colorscheme
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox " must appear *after* enabling syntax highlighting

" Look and feel
set backspace=2 " the default OS X and Linux(?) vimrc files do this anyway
set colorcolumn=80
set incsearch
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nowrap
set number
set ttimeoutlen=0 " same as MacVim; updates powerline immediately on Escape

" Key bindings
let mapleader="\<Space>"

nnoremap <Leader>q :wq<CR>
nnoremap <Leader>w :w<CR>

nmap ,, :tabnew ~/.files/.vimrc<CR>
nmap <Leader>` :CtrlPBuffer<CR>
nmap <S-Tab> <C-o>

nmap <Leader><Tab> :set list! list?<CR>
nmap <Leader>- :StripWhitespace<CR>
nmap <Leader>/ :set hlsearch!<CR>

nnoremap <Leader>{ :tabprevious<CR>
nnoremap <Leader>} :tabnext<CR>
nnoremap <Leader>L <C-w>l
nnoremap <Leader>H <C-w>h
nnoremap <Leader>J <C-w>j
nnoremap <Leader>K <C-w>k

map <Leader>c :checktime<CR>
nmap <Leader>f :Ag<Space>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gvdiff<CR>
map <Leader>gg :GitGutter<CR>
map <Leader>gm :Gmove
map <Leader>gs :Gstatus<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader>r :%s/
nmap <Leader>sl :colorscheme summerfruit256<CR>
nmap <Leader>sd :set background=dark<CR> :colorscheme gruvbox<CR>
nmap <Leader>t :tabnew<CR>

" Plugin settings
"" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#default#section_truncate_width={
  \ 'b': 79,
  \ 'x': 60,
  \ 'y': 88,
  \ 'z': 80,
  \ }
let g:airline_mode_map={
  \ '__' : '------',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'REPLACE',
  \ 'v'  : 'V',
  \ 'V'  : 'V-LINE',
  \ 'c'  : 'COMMAND',
  \ 's'  : 'SELECT',
  \ 'S'  : 'S-LINE',
  \ 't'  : 'TERMINAL',
  \ }
let g:airline_theme='kalisi'

"" Ctrl-P
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore='\v[\/](\.(git|hg|svn)|node_modules)$'

"" Gitgutter
let g:gitgutter_sign_column_always=1

"" Multiple Cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction

"" Neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_force_overwrite_completefunc=1 " for vim-clojure-static
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" Rainbow parentheses
au BufEnter *.clj RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

"" Syntastic
""" recommended settings (from help)
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0

""" filetype-specific settings
let g:syntastic_javascript_checkers=['eslint']
