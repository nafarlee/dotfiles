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
NeoBundle 'tpope/vim-markdown'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'moll/vim-node'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'freeo/vim-kalisi'
NeoBundle 'maksimr/vim-jsbeautify'

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
let g:syntastic_javascript_checkers = ['eslint']


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
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
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
	let $NVIM_TUI_ENABLE_TRUE_COLORS=1
endif
