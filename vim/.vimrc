set shell=/bin/bash

" Install executables needed by certain plugins
if !executable('editorconfig')
	silent !brew install editorconfig
endif

if !executable('fzf')
	silent !brew install fzf
endif

" Install vim-plug if it isn't there
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neocomplete.vim'
Plug 'markonm/traces.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'tomtom/tcomment_vim'
Plug 'benmills/vimux'
Plug 'tpope/vim-vinegar'

packadd! matchit

call plug#end()

" Setup TernJS if this is the first time
if !isdirectory(glob("~/.vim/plugged/tern_for_vim/node_modules")) &&
			\ isdirectory(glob("~/.vim/plugged/tern_for_vim"))
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
au FileType typescriptreact setlocal suffixesadd=.ts " make gf work with CommonJS
au FileType markdown setlocal tw=79 spell

" Colors and colorscheme
function! ColorschemeDark()
	set background=dark
	colorscheme spacegray
endfunction

function! ColorschemeLight()
	set background=light
	colorscheme pencil
endfunction

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors
silent! call ColorschemeDark()

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
set path+=**
set scrolloff=1
set shiftwidth=4
set tabstop=4
set ttimeoutlen=0 " same as MacVim; updates powerline immediately on Escape
set wildmenu

set statusline=
set statusline +=\ %f%h%m%r%w
set statusline +=%=%{fugitive#statusline()}
set statusline +=%=\ %y

" Key bindings
let mapleader="\<Space>"

nnoremap <Leader>w :w<CR>

nmap <Leader>, :tabnew ~/.vimrc<CR>
nmap <Leader>1 :VimuxPromptCommand<CR>
nmap <Leader>! :VimuxRunLastCommand<CR>
nmap <Leader>- :StripWhitespace<CR>
nmap <Leader>< :SidewaysLeft<CR>
nmap <Leader>> :SidewaysRight<CR>
nmap <Leader>/ :noh<CR>
map <Leader>c :checktime<CR>
nmap <silent> <Leader>d <Plug>DashSearch
map <Leader>gb :Gblame<CR>
map <Leader>gd :Gvdiff<CR>
map <Leader>gg :GitGutter<CR>
map <Leader>gm :Gmove
map <Leader>gs :Gstatus<CR>
nmap <Leader>o :Files<CR>
nmap <Leader>p :GFiles<CR>
nmap <Leader>q :Buffers<CR>
nmap <Leader>r :redraw!<CR>
nmap <Leader>s :%s/

" Plugin settings
"" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['vue'] = ['eslint']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

"" delimitMate
let delimitMate_expand_cr = 1

"" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

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
