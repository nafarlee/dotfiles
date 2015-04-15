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
NeoBundle 'bling/vim-airline'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Raimondi/delimitMate'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'moll/vim-node'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'freeo/vim-kalisi'

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

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
colorscheme kalisi
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
inoremap jk <esc>
inoremap kj <esc>
let mapleader="\<Space>"

nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

nnoremap <Leader>n :bn<CR>

if has("gui_gtk2")
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10
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

"Neovim Options
if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLORS=1
endif
