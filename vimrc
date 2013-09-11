set smartindent
set ignorecase
set nohidden
set number
set laststatus=2
set nocompatible
set showmatch
set t_Co=256
colorscheme molokai
set tabstop=4
set shiftwidth=4
set nowrap
syntax on
set ofu=syntaxcomplete#Complete
filetype on
call pathogen#infect()
call pathogen#helptags()
filetype indent on
filetype plugin on
map <F2> :NERDTreeToggle<CR>
map <F6> :vertical res -3<CR>
map <F7> :vertical res +3<CR>
nnoremap z} zfa}
inoremap jk <esc>
inoremap kj <esc>
let mapleader=","

autocmd FileType c map <F9> :!gcc -o "%:p:r.out" -lm "%:p" && "%:p:r.out"<CR>
autocmd FileType cpp map <F9> :!g++ -o "%:p:r.o" -lm "%:p" && "%:p:r.o"<CR>
