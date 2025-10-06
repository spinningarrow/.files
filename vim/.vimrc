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
set showcmd
set smartcase
set tabstop=4
set tagfunc=CocTagFunc
set ttimeoutlen=0 " same as MacVim; updates powerline immediately on Escape
set wildmenu

function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline=
set statusline +=\ %f%h%m%r%w
set statusline +=%=%{fugitive#statusline()}
set statusline+=%=\ [%{GitStatus()}]
set statusline +=%=\ %y

colorscheme spacegray

" Key bindings
let mapleader="\<Space>"

nnoremap - :Explore<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>- :StripWhitespace<CR>
nnoremap <Leader>/ :noh<CR>
noremap <Leader>c :checktime<CR>
noremap <Leader>r :Rg<CR>
noremap <Leader>f :GGrep<CR>
noremap <Leader>gg :GitGutter<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>q :Buffers<CR>

" Plugin settings
"" ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['vue'] = ['eslint']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['typescriptreact'] = ['prettier']
let g:ale_fixers['terraform'] = ['terraform']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

"" delimitMate
let delimitMate_expand_cr = 1

"" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

"" fzf
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.fzf#shellescape(<q-args>),
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0], 'options': '--no-hscroll'}, 'up', 'ctrl-\'), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg -u --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--no-hscroll'}, 'up', 'ctrl-\'), <bang>0)

"" Gitgutter
set signcolumn=yes

"" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_maxfilenamelen = 64

" Automatically apply vimrc changes on save
augroup SourceVimrcOnSave
	autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup end
