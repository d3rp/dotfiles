"filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins / Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
"call vundle#begin()
"
" Changed to dein
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 " deoplete replaces neocomplete
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   " Recommended for deoplete by its docs 
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif
 " Utilities - plugin from http://vim-scripts.org/vim/scripts.html
 call dein#add('vim-scripts/L9')
 " plugin on GitHub repo / tpope
 call dein#add('tpope/vim-fugitive')
 " Moar tpope
 call dein#add('tpope/vim-obsession')
 " Colors
 call dein#add('altercation/vim-colors-solarized.git')
 " NERD commenter
 call dein#add('scrooloose/nerdcommenter.git')
 " CtrlP for file and tag finding
 call dein#add('ctrlpvim/ctrlp.vim')
 " Expand region for quick selection in visual mode ..
 call dein#add('terryma/vim-expand-region.git')
 " vim-airline, powerline derivative control bar thing
 call dein#add('vim-airline/vim-airline')
 " Themes. .. 
 call dein#add('vim-airline/vim-airline-themes')
 " PlantUML syntax
 call dein#add('aklt/plantuml-syntax')
 " Latex stuff
 "Plugin 'lervag/vimtex'
 " R integration to vim
 call dein#add('jalvesaq/Nvim-R')
 " Haskell
 "Plugin 'neovimhaskell/haskell-vim'
 " Dependency for easytags
 call dein#add('xolox/vim-misc')
 " Requires Excuberant ctags (or universal-ctags on arch)
 call dein#add('xolox/vim-easytags')
 " tagbar using easytags to display a summary of tags in file
 call dein#add('majutsushi/tagbar')
 " Switching between headers and implementations in cpp
 call dein#add('derekwyatt/vim-fswitch')
 " diary and outliner
 call dein#add('vimoutliner/vimoutliner')
 " Ale linter
 "Plugin 'w0rp/ale'

 call dein#end()
 call dein#save_state()
endif

" All of your Plugins must be added before the following line call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
" To ignore plugin indent changes, instead use:
"filetype plugin on

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
set guifont=Source\ Code\ Pro\ for\ Powerline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours, solarized, monokai etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
syntax enable
"set nocompatible                                                  
set t_Co=256
set background=dark
" Solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
" Molokai
"" original monokai background color
let g:molokai_original = 1
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
" => UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enabling mouse for quick course of actions = moar redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
if !has('nvim')
    set ttymouse=xterm2
endif

" Window movement shortcuts
" Window Functions / from nicknisi/vim-workshop
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
" move to the window in the direction shown
" Split/create a new window if at the edge
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"
" mapping leader to space
let mapleader = "\ "
" Happy copy-pasting
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set clipboard^=unnamed
"
" Where to place newly created windows (by ctrlp)
let g:ctrlp_open_new_file = 'v'

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete configuration for autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Scala and Java (eclim etc)     
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-scala
"let g:scala_use_default_keymappings = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick shot python
nnoremap <Leader>P :w<CR>:!python3 %<CR>
"
"ctags
"set tags=tags;/
set tags=./.tags,.tags,./tags,tags
" gvim options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bash scripting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running script
nnoremap <Leader>b :w<CR>:!chmod +x %<CR>:!bash %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Web dev
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet.vim specified only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mergetool
nmap ]r :diffget RE
nmap ]l :diffget LO

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Calendars and other utils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Google calendar sync
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_week_number = 1
let g:calendar_first_day = "monday"
"
"plantuml short key
nnoremap <Leader>U :w tmp.uml\|!cat tmp.uml\| plantuml -p \| feh - \| rm tmp.uml<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux / Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-v> :VimuxRunCommand("")<LEFT><LEFT>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Drag Visuals / Damien Conway
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
let g:DVB_TrimWS = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vmath - columnar quick maths / Damien Conway
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <silent><expr>  ++  VMATH_YankAndAnalyse()
nmap <silent>        ++  vip++

nmap ;ss    :set    spell   spellang=en-basic<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim latex realtime viewer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:livepreview_previewer = 'zathura'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi
"
" Starting on 2017 jedi started spewing it's suggestions into the
" file without removing them when exiting the insert view. Thus it
" resulted in millions of back-and-forth actions because the python files
" wouldn't run - obviously.
"
" use jedi completions for python with neocomplete
"if !exists('g:neocomplete#force_omni_input_patterns')
    "let g:neocomplete#force_omni_input_patterns = {}
"endif
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick explorer (netrw) invocation
let g:netrw_liststyle = 3
map <Leader>x :Explore<cr>
map <Leader>s :Sexplore<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Load all plugins now (vim8 needs no plugin managers(?))
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale linting, fixing and more..
" Python fixers
let g:ale_fixers = {'python': ['autopep8','isort']}

let g:ale_lint_on_insert_leave = 1

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

" Ale + airline config
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar with ctags
" Tagbar quickkey
nmap <F9> :TagbarToggle<CR>
nmap <F10> :UpdateTags<CR>

let g:easytags_ctags_version = 5.8

" Mappings for FSwitch that switches between headers and implementations
" derekwyatt/vim-FSwitch
" Used to be <Leader>o but that is mapped to ctrlp
"- Switch to the file and load it into the current window >
nmap <silent> <Leader>ff :FSHere<cr>
"- Switch tf the file and lfad it intf the windfw fn the right >
nmap <silent> <Leader>fl :FSRight<cr>
"- Switch tf the file and lfad it intf a new windfw split fn the right >
nmap <silent> <Leader>fL :FSSplitRight<cr>
"- Switch tf the file and lfad it intf the windfw fn the left >
nmap <silent> <Leader>fh :FSLeft<cr>
"- Switch tf the file and lfad it intf a new windfw split fn the left >
nmap <silent> <Leader>fH :FSSplitLeft<cr>
"- Switch tf the file and lfad it intf the windfw abfve >
nmap <silent> <Leader>fk :FSAbove<cr>
"- Switch tf the file and lfad it intf a new windfw split abfve >
nmap <silent> <Leader>fK :FSSplitAbove<cr>
"- Switch tf the file and lfad it intf the windfw belfw >
nmap <silent> <Leader>fj :FSBelow<cr>
"- Switch tf the file and lfad it intf a new windfw split belfw >
nmap <silent> <Leader>fJ :FSSplitBelow<cr>

" vim-easytags
"set cpo+=d
"set tags=./tags;
"let g:easytags_dynamic_files = 2
"let g:easytags_autorecurse = 1

