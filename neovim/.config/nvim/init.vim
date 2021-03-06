call plug#begin()

""Plugs Here
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'jjo/vim-cue'
Plug 'luochen1990/rainbow'

call plug#end()

"rainbow
let g:rainbow_active = 1

"ale
let g:ale_linters = {'rust': ['cargo']}
let g:ale_rust_cargo_use_check = 1

"fzf
nmap <C-p> :Files<CR>
nmap <C-o> :Rg<CR>
nmap <C-i> :GFiles<CR>

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_extensions = []

"sensibles
set encoding=utf-8
set ignorecase
set number
set hidden
set incsearch
set backspace=indent,eol,start
set hlsearch
set showcmd
set wildmenu
set mouse=a
set omnifunc=syntaxcomplete#Complete
set inccommand=split

"indentation
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap


"lightline
let g:lightline = { 'colorscheme': 'one' }


"visual
set laststatus=2
set noshowmode
set showmatch
set colorcolumn=100
set cursorline

set t_Co=256
colorscheme onedark
set background=dark
let g:rehash256 = 1


"filetypes
filetype on
filetype indent on
filetype plugin on
set foldmethod=syntax
syntax on

autocmd FileType python set expandtab
autocmd FileType objc set sw=4 ts=4 sts=4
autocmd FileType elm set sw=4 ts=4 sts=4
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype html setl sw=2 ts=2 et sts=2

autocmd FileType javascript map <buffer> <Leader>r :!node %<CR>

"remaps
inoremap jk <esc>
inoremap kj <esc>
let mapleader="\<Space>"

nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

nmap <C-Up> :wincmd +<CR>
nmap <C-Down> :wincmd -<CR>
nmap <C-Left> :wincmd <<CR>
nmap <C-Right> :wincmd ><CR>

nnoremap <Leader>n :bn<CR>
nnoremap <Leader>c :b#<bar>bd#<CR>
nnoremap <Leader>, :vertical resize -10<CR>
nnoremap <Leader>. :vertical resize +10<CR>

if has("gui_gtk2")
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

"Windows Options
if has('win32')
	:cd $HOME
	set guifont=Sauce_Code_Powerline:h11
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

"Neovim Options
if has('nvim')
        set termguicolors
	tnoremap jk <C-\><C-n>
	tnoremap kj <C-\><C-n>
endif

if has('lua')
        "nvim-colorizer
        lua require'colorizer'.setup()
endif
