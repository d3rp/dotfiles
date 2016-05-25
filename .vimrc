set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Utilities - plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Calendar
"Plugin 'itchyny/calendar.vim'
" Colors
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
" Scala for Vim
Bundle 'derekwyatt/vim-scala'
" NERD commenter
Plugin 'git://github.com/scrooloose/nerdcommenter.git'
" FuzzyFinder
"Plugin 'git://github.com/atom/fuzzy-finder.git'
" CtrlP for file and tag finding
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
" Expand region for quick selection in visual mode ..
Plugin 'https://github.com/terryma/vim-expand-region.git'
" C++ autocompletion
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" vim-airline, powerline derivative control bar thing
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" web design
Plugin 'mattn/emmet-vim'
" rst stuff
Bundle 'Rykka/riv.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Google calendar sync
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_week_number = 1
let g:calendar_first_day = "monday"

" vim-scala
let g:scala_use_default_keymappings = 1

" Color scheme
syntax enable

"set nocompatible                                                  
set t_Co=256
set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
"" original monokai background color
"let g:molokai_original = 1
"" alternative, more truthful to 256 color scheme
let g:rehash256 = 1
colorscheme molokai

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" " How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set clipboard=unnamedplus

" Emmet.vim specified only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi autocompletions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Line numbers
set number
set breakindent showbreak=\ \
" set foldmethod=indent foldcolumn=1
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
nnoremap ; :
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" powerline fonts for vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'

""""""""""""""""""""""""""""""
" => mapping ftw
""""""""""""""""""""""""""""""
let mapleader = "\ "
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><CR> O<C-c>
nnoremap <Leader><Leader> <C-v>
nnoremap <Leader>- 60i-<C-c>
"plantuml short key
nnoremap <Leader>U :w tmp.uml\|!cat tmp.uml\| plantuml -p \| feh - \| rm tmp.uml<CR>
"enabling mouse for quick course of actions
"moar redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm

"ctags
"set tags=tags;/
set tags=./.tags,.tags,./tags,tags

" mergetool
nmap ]r :diffget RE
nmap ]l :diffget LO

" gvim options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
