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

nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr> 
autocmd Filetype python map <F9> :!python "%:p"<CR>

if has('win32')
	set guifont=Source_Code_Pro:h12
endif

"Made Obsolete by SingleCompile
"autocmd FileType c map <F9> :!gcc -o "%:p:r.out" -lm "%:p" && "%:p:r.out"<CR>
"autocmd FileType cpp map <F9> :!g++ -o "%:p:r.o" -lm "%:p" && "%:p:r.o"<CR>
"autocmd FileType cpp map <F8> :!g++ -o "%:p:r.o" -lm "%:p" && echo "Compilation completed succesfully"<CR>
"autocmd Filetype sh map <F9> :!"%:p"<CR>
"autocmd Filetype python map <F9> :!python "%:p"<CR>
"autocmd FileType java map <F9> :!javac "%:p" && java "%<"<CR>
