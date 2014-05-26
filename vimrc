"NeoBundle
if has('win32')
	set runtimepath+=~/vimfiles/bundle/neobundle.vim/
	call neobundle#begin(expand('~/vimfiles/bundle/'))
else
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
endif


""Bundles Here
NeoBundle "scrooloose/syntastic"
NeoBundle "flazz/vim-colorschemes"
NeoBundle 'bling/vim-airline'
NeoBundle "Shougo/unite.vim"
NeoBundle "vim-scripts/CSApprox"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'othree/html5.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"vim-airline
let g:airline#extensions#tabline#enabled = 1

"sensibles
set ignorecase
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
set colorcolumn=80

set t_Co=256
colorscheme molokai


"filetypes
filetype on
filetype indent on
filetype plugin on
syntax on

autocmd FileType python set expandtab
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"remaps
map <F6> :vertical res -3<CR>
map <F7> :vertical res +3<CR>
nnoremap z} zfa}
inoremap jk <esc>
inoremap kj <esc>
let mapleader="\<Space>"

nnoremap <C-p> :Unite -start-insert file_rec<CR>


"fonting
if has('win32')
	set guifont=Source_Code_Pro:h12
endif

if has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ Bold\ 10
endif

