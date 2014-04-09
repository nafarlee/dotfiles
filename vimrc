"NeoBundle
if has('win32')
	set runtimepath+=~/vimfiles/bundle/neobundle.vim/
	call neobundle#begin(expand('~/vimfiles/bundle/'))
else
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
endif


NeoBundleFetch 'Shougo/neobundle.vim'

""Bundles Here
NeoBundle "scrooloose/syntastic"

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


"indentation
set smartindent
set tabstop=4
set shiftwidth=4
set nowrap


"sensibles
set ignorecase
set number
set nohidden
set nocompatible


"visual
set laststatus=2
set showmatch
set colorcolumn=80

set t_Co=256
colorscheme blue


"filetypes
filetype on
filetype indent on
filetype plugin on
syntax on

autocmd FileType python set expandtab


"remaps
map <F6> :vertical res -3<CR>
map <F7> :vertical res +3<CR>
nnoremap z} zfa}
inoremap jk <esc>
inoremap kj <esc>
let mapleader="\<Space>"


"fonting
if has('win32')
	set guifont=Source_Code_Pro:h12
endif

if has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ Bold\ 10
endif

