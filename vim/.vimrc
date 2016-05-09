set shell=/bin/bash

" Install vim-plug if it isn't there
if !executable('ag')
	silent !brew install ag
endif

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'gabesoft/vim-ags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'keith/investigate.vim'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/neocomplcache.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'

call plug#end()

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" Syntax
syntax enable
autocmd BufNewFile,BufRead *.fish set ft=sh " highlight Fish files
autocmd BufNewFile,BufRead build.boot set ft=clojure " highlight build.boot
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS

" Colorscheme
function! ColorschemeDark()
	set background=dark
	" let g:airline_theme='hybridline'
	" silent! AirlineRefresh
	colorscheme tayra
	colorscheme tropikos
endfunction

function! ColorschemeLight()
	set background=light
	let g:airline_theme='silver'
	silent! AirlineRefresh
	colorscheme pencil
endfunction

call ColorschemeDark()

" Look and feel
set backspace=2 " the default OS X and Linux(?) vimrc files do this anyway
set colorcolumn=80
set foldmethod=syntax
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:▸—
set mouse=a
set nofoldenable
set nowrap
set number
set relativenumber
set scrolloff=1
set shiftwidth=4
set tabstop=4
set ttimeoutlen=0 " same as MacVim; updates powerline immediately on Escape

" Key bindings
let mapleader="\<Space>"

nnoremap <S-Tab> za

nnoremap <Leader>q :x<CR>
nnoremap <Leader>w :w<CR>

nmap <Leader>, :tabnew ~/.vimrc<CR>
nmap <Leader>` :CtrlPBuffer<CR>

nmap <Leader>- :StripWhitespace<CR>

nnoremap <Leader>{ :tabprevious<CR>
nnoremap <Leader>} :tabnext<CR>

nmap <Leader>/ :noh<CR>
map <Leader><Leader> :h<Space>
map <Leader>c :checktime<CR>
nmap <silent> <Leader>d <Plug>DashSearch
nmap <Leader>f :Ags<Space>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gvdiff<CR>
map <Leader>gg :GitGutter<CR>
map <Leader>gm :Gmove
map <Leader>gs :Gstatus<CR>
nmap <Leader>k :NERDTreeToggle<CR>
nmap <Leader>p "+p
nmap <Leader>r :redraw!<CR>
nmap <Leader>s :%s/
nmap <Leader>t :tabnew<CR>
map <Leader>y "+y

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
let g:airline#extensions#hunks#enabled=0
let g:airline_theme='hybridline'

"" Better Whitespace
let g:better_whitespace_verbosity=1

"" Ctrl-P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
	\ --ignore .git
	\ --ignore .svn
	\ --ignore .hg
	\ --ignore .DS_Store
	\ --ignore "**/*.pyc"
	\ -g ""'

" automatically clear cache on file save
function! SetupCtrlP()
	if exists("g:loaded_ctrlp") && g:loaded_ctrlp
		augroup CtrlPExtension
			autocmd!
			autocmd FocusGained  * CtrlPClearCache
			autocmd BufWritePost * CtrlPClearCache
		augroup END
	endif
endfunction

if has("autocmd")
	autocmd VimEnter * :call SetupCtrlP()
endif

"" Gitgutter
let g:gitgutter_sign_column_always=1

"" Multiple Cursors and Neocomplcache
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
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"" Syntastic
""" recommended settings (from help)
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0

""" filetype-specific settings
let g:syntastic_javascript_checkers=['eslint']
