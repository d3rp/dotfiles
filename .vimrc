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
" TODO check if on macos
" set runtimepath+=/opt/homebrew/opt/fzf

" Install with ```call dein#install()```
if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 " deoplete replaces neocomplete
 call dein#add('shougo/deoplete.nvim')
 if has('nvim')
   " Recommended for deoplete by its docs 
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
   call dein#add('numirias/semshi')
   call dein#add('zchee/deoplete-jedi')
   call dein#add('neovim/python-client')
    "Jedi for python
   "call dein#add('davidhalter/jedi')
 endif

 " ./install --all so the interactive script doesn't block
 " you can check the other command line options  in the install file
 call dein#add('junegunn/fzf', { 'build': './install --all', 'rtp': '', 'merged': 0 }) 
 call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

 " colorschemes
 "call dein#add('tomasr/molokai')
 "call dein#add('itchyny/lightline.vim')
 call dein#add('joshdick/onedark.vim')
 "call dein#add('altercation/vim-colors-solarized.git')
 "call dein#add('sainnhe/sonokai')
 " Themes. .. 
 call dein#add('vim-airline/vim-airline-themes')
 "call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})

 call dein#add('sheerun/vim-polyglot')
 " Utilities - plugin from http://vim-scripts.org/vim/scripts.html
 call dein#add('vim-scripts/L9')
 " plugin on GitHub repo / tpope
 call dein#add('tpope/vim-fugitive')
 " Moar tpope (tmux resurrect interaction)
 call dein#add('tpope/vim-obsession')

 " Devops crap - Ansible
 call dein#add('pearofducks/ansible-vim')

 " NERD commenter and NERDTree
 call dein#add('scrooloose/nerdcommenter.git')
 call dein#add('preservim/nerdtree')

 " CtrlP for file and tag finding
 call dein#add('ctrlpvim/ctrlp.vim')
 " Expand region for quick selection in visual mode ..
 call dein#add('terryma/vim-expand-region.git')
 " vim-airline, powerline derivative control bar thing
 call dein#add('vim-airline/vim-airline')
 " PlantUML syntax
 call dein#add('aklt/plantuml-syntax')
 " Latex stuff
 "Plugin 'lervag/vimtex'
 " R integration to vim
 "call dein#add('jalvesaq/Nvim-R')
 " Haskell
 "Plugin 'neovimhaskell/haskell-vim'
 " Dependency for easytags
 call dein#add('xolox/vim-misc')
 " Requires Excuberant ctags (or universal-ctags on arch)
 call dein#add('Wraul/vim-easytags', {'rev': 'fix-universal-detection'})
 " tagbar using easytags to display a summary of tags in file
 call dein#add('majutsushi/tagbar')
 " Switching between headers and implementations in cpp
 call dein#add('derekwyatt/vim-fswitch')
 " diary and outliner
 call dein#add('vimoutliner/vimoutliner')
 " Ale linter
 "Plugin 'w0rp/ale'
 " pydoc for shift-K python documentation
 call dein#add('fs111/pydoc.vim')
 " wiki notes, diary, todo lists ...
 call dein#add('vimwiki/vimwiki')
 " rust
 call dein#add('rust-lang/rust.vim')
 call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'master', 'build': 'yarn install --frozen-lockfile' })

 call dein#add('stevearc/dressing.nvim')
 call dein#add('nvim-lua/plenary.nvim')
 call dein#add('mfussenegger/nvim-dap')
 call dein#add('Shatur/neovim-cmake')

 call dein#add('mattn/emmet-vim')
 call dein#add('pangloss/vim-javascript')
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
"let g:airline_theme = 'onedark'
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
"set guifont=Inconsolata\ for\ Powerline:h13

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours, solarized, monokai etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
syntax enable
"set nocompatible                                                  
set t_Co=256
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""

" Solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
" Molokai
"" original monokai background color
"let g:molokai_original = 1
"" alternative, more truthful to 256 color scheme
"let g:rehash256 = 1
"colorscheme molokai

if has('termguicolors')
  set termguicolors
endif
"let g:sonokai_style = 'atlantis'
"let g:sonokai_better_performance = 1
"colorscheme sonokai

colorscheme onedark

" Highlight search results
set hlsearch
" Show matching brackets when text indicator is over them
set showmatch
" " How many tenths of a second to blink when matching brackets
set mat=2
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" set ripgrep as external grep program
"set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treesitter, language parsing

"luafile ~/.treesitter_config.lua

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
nnoremap <Leader>Q :xa<CR>
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
let g:ctrlp_extensions = ['buffertag']

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

" Run the file and save stdout to clipboard
nnoremap \p :let @+=system("python3 " . shellescape(expand("%")))<CR>


function! CalcScoreLine()
    let saved_reg = @@

    normal yy
    let scoreline = @@
    let @@="    - " . system("python3 $HOME/code/py/scoreline.py " . shellescape(scoreline))
    normal p

    let @@ = saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
set tags=./.tags,.tags,./tags,tags

map tn :tn<CR>
map tp :tp<CR>

" gvim options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bash scripting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running script
nnoremap <Leader>B :w<CR>:!chmod +x %<CR>:!bash %<CR>

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
nmap ]b :diffget BASE<CR>
nmap ]r :diffget REMOTE<CR>
nmap ]l :diffget LOCAL<CR>

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
nnoremap <Leader>U :w tmp.uml\|!cat tmp.uml\| plantuml -p \| open -a preview - \| rm tmp.uml<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux / Vimux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-v> :VimuxRunCommand("")<LEFT><LEFT>

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
"if !exists('g:deoplete#force_omni_input_patterns')
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
"map <Leader>x :Explore<cr>
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
let g:ale_fixers = {
\ 'python': ['autopep8','isort', 'remove_trailing_lines', 'trim_whitespace'],
\ 'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\ 'c': ['clang-format', 'remove_trailing_lines', 'trim_whitespace']}

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" vim configuration

nmap \e :e ~/.vimrc<CR>
nmap \r :source $MYVIMRC<CR>:call dein#install()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation

nmap <Leader>x :NERDTree<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Overriding vimoutliner tabsettings
au BufEnter *.otl setlocal tabstop=2
au BufEnter *.otl setlocal shiftwidth=2

" cppman for cpp reference with shift+k
autocmd FileType cpp set keywordprg=cppman

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki setup
let g:vimwiki_list = [
            \ {'list_margin': 2},
            \ {'path': '~/vimwiki/'},
            \ {'path': '~/docs/work/oeksound/vimwiki/'}]
let g:vimwiki_listsyms = ' ◤▣'
"let g:vimwiki_folding = 'list'

nmap <Leader>t <Plug>VimwikiToggleListItem
au BufEnter *.wiki setlocal shiftwidth=2
au BufEnter *.wiki setlocal tw=80

nmap <Leader>e :vimgrep /\cerror/j %<CR>:cwindow<CR>

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin': $HOME . '/.vim/vimwiki_tags.py'
          \ , 'ctagsargs': 'default'
          \ }
let g:tagbar_singleclick = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.45, 'relative': v:true, 'yoffset': 1.0 } }

command! -bang -nargs=* Vwrg 
  \ call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>)." ~/vimwiki",
  \ {'options': ['--preview', '~/.cache/dein/repos/github.com/junegunn/fzf.vim/bin/preview.sh {}']},
  \ <bang>0)


nnoremap \f :Vwrg<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <Leader>n :call NumberToggle()<CR>
" toggle line number modes

" Quick buffers
noremap <Leader>b :ls<CR>:b 

noremap <Leader>W :read !python ~/code/py/print_weekday.py<CR>
noremap <Leader>W :read !~/code/bin/weekday<CR>

