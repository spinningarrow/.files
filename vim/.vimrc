set shell=/bin/bash

filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

packadd! matchit

" Syntax
if !exists("g:syntax_on")
	syntax enable
endif
au FileType javascript setlocal suffixesadd=.js " make gf work
au FileType typescriptreact setlocal suffixesadd=.ts " make gf work
au FileType markdown setlocal tw=79 spell

" Better color support
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
if exists('$TMUX')
	set termguicolors
endif

" Look and feel
set background=dark
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

colorscheme spacegray

" Key bindings
let mapleader="\<Space>"

nnoremap - :Explore<CR>
nnoremap <Leader>w :w<CR>
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
let g:netrw_banner = 0
let g:netrw_liststyle = 1

" Automatically apply vimrc changes on save
augroup SourceVimrcOnSave
	autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup end
