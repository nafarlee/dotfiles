call pathogen#infect()
call pathogen#helptags()
set ofu=syntaxcomplete#Complete

set smartindent
set ignorecase
set nohidden
set number
set laststatus=2
set nocompatible
set showmatch
set tabstop=4
set shiftwidth=4
set nowrap
set colorcolumn=80
filetype on
filetype indent on
filetype plugin on

autocmd FileType python set expandtab

set t_Co=256
syntax on
colorscheme molokai

map <F2> :NERDTreeToggle<CR>

map <F6> :vertical res -3<CR>
map <F7> :vertical res +3<CR>
nnoremap z} zfa}
inoremap jk <esc>
inoremap kj <esc>
let mapleader=","

if has('win32')
	set guifont=Source_Code_Pro:h12
endif

if has("gui_gtk2")
	set guifont=DejaVu\ Sans\ Mono\ Bold\ 10
endif

