call plug#begin()

""Plugs Here
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'chrisyip/Better-CSS-Syntax-for-Vim'
Plug 'wting/rust.vim'
Plug 'guns/vim-clojure-static'
Plug 'msanders/cocoa.vim'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'mustache/vim-mustache-handlebars'

Plug 'chriskempson/base16-vim'
Plug 'freeo/vim-kalisi'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nielsmadan/harlequin'
Plug 'tomasr/molokai'

Plug 'benekastah/neomake'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'

call plug#end()

"rust
let g:rustfmt_autosave = 1

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"neomake
autocmd! BufWritePost * Neomake

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"js-beautify
autocmd FileType javascript noremap <buffer> <Leader>b :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <Leader>b :call JsBeautify()<cr>
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_size = '2'

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]node_modules|\.(git|hg|svn)$'

"sensibles
set encoding=utf-8
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
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap


"visual
set laststatus=2
set showmatch
set colorcolumn=81
set cursorline

set t_Co=256
colorscheme base16-chalk
set background=dark


"filetypes
filetype on
filetype indent on
filetype plugin on
set foldmethod=syntax
syntax on

autocmd FileType python set expandtab
autocmd FileType objc set sw=4 ts=4 sts=4
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd Filetype html setl sw=2 ts=2 et sts=2

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
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	tnoremap jk <C-\><C-n>
	tnoremap kj <C-\><C-n>
endif
