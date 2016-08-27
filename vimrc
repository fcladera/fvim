""------------------------------------------------------------
"" Configurations before loading plugins
""------------------------------------------------------------

""------------------------------------------------------------
"" Load plugins with plug.vim
""------------------------------------------------------------

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
call plug#end()
""------------------------------------------------------------
"" Basic configurations
""------------------------------------------------------------

set nocompatible  " Use vim instead of vi

if has('autocmd')
  filetype plugin indent on "File type detection and language-dependent indenting
endif

if has('syntax')
  syntax enable "Switches on syntax highlighting
endif

set backspace=indent,eol,start  " Backspace delete over line breaks

set fileformats=unix,dos        " Prefer Unix based file format, only LF at end line

set autoindent  " Copy indent from current line when starting a new line
set smartindent " Do smart autoindenting when starting a new line

set ignorecase  " Ignore case in search patterns
set smartcase   " Unless upercase found

set complete-=i " Completion from include files disabled
set smarttab    " <Tab> in front of a line inserts blanks according to 'shiftwidth'

set nrformats-=octal " Avoid numbers as 007 to be read as octal numbers

set ttimeout         " Set a timeout for operator-pending mode
set ttimeoutlen=150  " Timeout value in ms

set wildmenu      " Command-line completion operates in an enhanced mode
set laststatus=2  " Always show a status line
set ruler         "Show the line and column number of the cursor position
set showcmd       "Show (partial) command in the last line of the screen

set scrolloff=1 " Set number of lines above and below the cursor

set display+=lastline " As much as possible of the last line in a window
                      " will be displayed instead of @ (char in
                      " listchars)

if has('gui_running')
  set encoding=utf-8  " Character encoding used inside Vim
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j  " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;  " Try to find tags file recursively
endif

set autoread  " Automatically reload files changed outside vim

set history=1000  " Set a long command history

set hidden  " Allow buffer switching without saving

if !empty(&viminfo)
  set viminfo^=!  " Don't override a blank viminfo
endif

set splitbelow " Split in a "more natural" way
set splitright

set incsearch " Show where the pattern matches while typing a search command
set hlsearch  " Highlight matches

set showmatch " Match brackets briefly

""------------------------------------------------------------
"" Appareance
""------------------------------------------------------------

set t_Co=256 " Enable 256 colors in vim

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ 16  " Set gui font
endif

set background=dark
colorscheme jellybeans " colorschemes in .vim/bundle/vim-colorscheme

set list " List mode: shows spaces, tabs and nbsp in text with special characters
set listchars=tab:›\ ,trail:•,nbsp:+   "List mode configuration

set cursorline " Highlight current line

""------------------------------------------------------------
"" General key maps
""------------------------------------------------------------

let mapleader = ',' " map leader to ,

set pastetoggle=<F10> " Toggle paste mode with f10

" Clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

nmap <silent> <leader>W :call StripTrailingWhitespace()<CR>

nmap <silent> <leader>F :call UpdateFvim()<CR>

nmap <silent> <leader>= :OnlineThesaurusCurrentWord<CR>

" New vertical window
nmap <F2> :vnew<CR>:e 

" New horizontal window
nmap <F3> :new<CR>:e 

" Parcourir les windows
nmap <Space> <C-W>w

" New tab
nmap <F6> :tabe<CR>:e 

" Previous tab
nmap <silent> <F7> :tabp<CR>

" Next tab
nmap <silent> <F8> :tabn<CR>

""------------------------------------------------------------
"" Command key maps
""------------------------------------------------------------

" Fix writing :Wq or :WQ to save and exit
command WQ wq
command Wq wq

""------------------------------------------------------------
"" Functions
""------------------------------------------------------------

"" Clear trailing whitespaces from spf13
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"" Update fivm
function! UpdateFvim()
  PlugUpdate
  sleep 1
  PlugClean!
  sleep 1
  bd
endfunction

""------------------------------------------------------------
"" Plugin - Ack.vim
""------------------------------------------------------------

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""------------------------------------------------------------
"" Language specific: Javascript
""------------------------------------------------------------
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab

""------------------------------------------------------------
"" Language specific: JSON
""------------------------------------------------------------
autocmd FileType json setlocal shiftwidth=4 tabstop=4 expandtab

""------------------------------------------------------------
"" Language specific: SHELL SCRIPT
""------------------------------------------------------------
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 expandtab

""------------------------------------------------------------
"" Language specific: HTML
""------------------------------------------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

""------------------------------------------------------------
"" Language specific: yaml
""------------------------------------------------------------
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
""------------------------------------------------------------

""------------------------------------------------------------
"" Language specific: makefile
""------------------------------------------------------------
autocmd FileType make setlocal shiftwidth=4 tabstop=4 noexpandtab
""------------------------------------------------------------
