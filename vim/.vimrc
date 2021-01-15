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
Plug 'markonm/traces.vim'
Plug 'bhurlow/vim-parinfer'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'benmills/vimux'
Plug 'tpope/vim-vinegar'

call plug#end()

packadd! matchit

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" Syntax
if !exists("g:syntax_on")
	syntax enable
endif
autocmd BufNewFile,BufRead *.tmux.conf set ft=sh
autocmd BufNewFile,BufRead build.boot set ft=clojure
au FileType javascript setlocal suffixesadd=.js " make gf work
au FileType typescriptreact setlocal suffixesadd=.ts " make gf work
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
if exists('$TMUX')
	set termguicolors
endif
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
nmap <Leader>1 :VimuxPromptCommand<CR>
nmap <Leader>! :VimuxRunLastCommand<CR>
nmap <Leader>- :StripWhitespace<CR>
nmap <Leader>/ :noh<CR>
map <Leader>c :checktime<CR>
map <Leader>gg :GitGutter<CR>
nmap <Leader>o :Files<CR>
nmap <Leader>p :GFiles<CR>
nmap <Leader>q :Buffers<CR>
inoremap <expr> <c-x><c-g> fzf#vim#complete('git coauthors')

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

"" netrw
let g:netrw_liststyle = 3

"" Over
let g:over#command_line#enable_import_commandline_map = 0 " for vim-searchindex

" Automatically apply vimrc changes on save
augroup SourceVimrcOnSave
	autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup end
