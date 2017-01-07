set shell=/bin/bash

" Install executables needed by certain plugins
if !executable('ag')
	silent !brew install ag
endif

if !executable('editorconfig')
	silent !brew install editorconfig
endif

" Install vim-plug if it isn't there
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
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'kien/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'keith/investigate.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bhurlow/vim-parinfer'
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'

" Experimental plugins
Plug 'metakirby5/codi.vim'

packadd! matchit

call plug#end()

" Setup TernJS if this is the first time
if !isdirectory(glob("~/.vim/plugged/tern_for_vim/node_modules"))
	!cd ~/.vim/plugged/tern_for_vim && npm install
endif

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" Syntax
syntax enable
autocmd BufNewFile,BufRead *.fish set ft=sh " highlight Fish files
autocmd BufNewFile,BufRead *.tmux.conf set ft=sh " highlight Tmux conf
autocmd BufNewFile,BufRead build.boot set ft=clojure " highlight build.boot
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS
au FileType markdown setlocal tw=79 spell
au FileType clojure :RainbowToggle

" Colors and colorscheme
function! ColorschemeDark()
	set background=dark
	colorscheme hybrid
endfunction

function! ColorschemeLight()
	set background=light
	let g:airline_theme='silver'
	silent! AirlineRefresh
	colorscheme pencil
endfunction

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors
call ColorschemeDark()

" Look and feel
set backspace=2 " the default OS X and Linux(?) vimrc files do this anyway
set clipboard=unnamed
set colorcolumn=80
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

nmap <Leader>< :SidewaysLeft<CR>
nmap <Leader>> :SidewaysRight<CR>
nmap <Leader>/ :noh<CR>
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

"" delimitMate
let delimitMate_expand_cr = 1

"" Editorconfig
let g:EditorConfig_core_mode = 'external_command'

"" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"" Gitgutter
let g:gitgutter_sign_column_always=1

"" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Rainbow
let g:rainbow_active=0

"" Syntastic
""" recommended settings (from help)
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0

"" TernJS
let g:tern_map_keys=1

""" filetype-specific settings
let g:syntastic_javascript_checkers=['eslint']
