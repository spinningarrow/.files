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
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'kien/ctrlp.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'keith/investigate.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'osyo-manga/vim-over'
Plug 'bhurlow/vim-parinfer'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
Plug 'google/vim-searchindex'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-surround'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'tomtom/tcomment_vim'
Plug 'benmills/vimux'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'

packadd! matchit

call plug#end()

" Setup TernJS if this is the first time
if !isdirectory(glob("~/.vim/plugged/tern_for_vim/node_modules"))
	if !executable('node')
		silent !brew install node
	endif

	!cd ~/.vim/plugged/tern_for_vim && npm install
endif

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" Syntax
if !exists("g:syntax_on")
	syntax enable
endif
autocmd BufNewFile,BufRead *.tmux.conf set ft=sh
autocmd BufNewFile,BufRead build.boot set ft=clojure
au FileType javascript setlocal suffixesadd=.js " make gf work with CommonJS
au FileType markdown setlocal tw=79 spell
au FileType clojure :RainbowToggle

" Colors and colorscheme
function! ColorschemeDark()
	set background=dark
	colorscheme onedark
endfunction

function! ColorschemeLight()
	set background=light
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
set smartcase
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

set statusline=
set statusline +=\ %f%h%m%r%w
set statusline +=%=%{fugitive#statusline()}
set statusline +=%=\ %y

" Key bindings
let mapleader="\<Space>"

nnoremap <Leader>w :w<CR>

nmap <Leader>, :tabnew ~/.vimrc<CR>
nmap <Leader>` :CtrlPBuffer<CR>
nmap <Leader>1 :VimuxPromptCommand<CR>
nmap <Leader>! :VimuxRunLastCommand<CR>
nmap <Leader>- :StripWhitespace<CR>
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
nmap <Leader>r :redraw!<CR>
nmap <Leader>s :OverCommandLine<CR>%s/

" Plugin settings
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
set signcolumn=yes

"" Neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" netrw
let g:netrw_liststyle = 3

"" Over
let g:over#command_line#enable_import_commandline_map = 0 " for vim-searchindex

"" Rainbow
let g:rainbow_active=0

"" TernJS
let g:tern_map_keys=1

" Automatically apply vimrc changes on save
augroup SourceVimrcOnSave
	autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup end
