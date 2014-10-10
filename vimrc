"NeoBundle
if has('win32')
	set runtimepath+=~/vimfiles/bundle/neobundle.vim/
	call neobundle#begin(expand('~/vimfiles/bundle/'))
else
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
endif


""Bundles Here
NeoBundle 'scrooloose/syntastic'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'whatyouhide/vim-gotham'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"sensibles
set encoding=utf-8
set ignorecase
set relativenumber
set number
set hidden
set nocompatible
set incsearch
set backspace=indent,eol,start
set hlsearch
set showcmd
set wildmenu
set mouse=a
set omnifunc=syntaxcomplete#Complete

"indentation
set smartindent
set tabstop=4
set shiftwidth=4
set nowrap


"visual
set laststatus=2
set showmatch
set colorcolumn=81
set cursorline

set t_Co=256
colorscheme base16-default
set background=dark


"filetypes
filetype on
filetype indent on
filetype plugin on
set foldmethod=syntax
syntax on

autocmd FileType python set expandtab
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"remaps
map <F6> :vertical res -3<CR>
map <F7> :vertical res +3<CR>
nmap <F8> :TagbarToggle<CR>

inoremap jk <esc>
inoremap kj <esc>
let mapleader="\<Space>"

nnoremap <C-p> :Unite -start-insert file_rec<CR>

nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

if has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ Bold\ 10
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

"Windows Options
if has('win32')
	set guifont=Sauce_Code_Powerline:h11
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

