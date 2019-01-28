""------------------------------------------------------------
"" Configurations before loading plugins
""------------------------------------------------------------

""------------------------------------------------------------
"" Load plugins with plug.vim
""------------------------------------------------------------
"function! DoRemote(arg)
"  UpdateRemotePlugins
"endfunction

call plug#begin()
Plug 'tpope/vim-surround'
" Show Git modifications in vim
Plug 'mhinz/vim-signify'
" Git vim wrapper
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'reedes/vim-wordy'
Plug 'vivien/vim-linux-coding-style'
Plug 'rhysd/vim-grammarous'
" Better use of Vim with tex files
Plug 'lervag/vimtex'
Plug 'vim-scripts/loremipsum'
" Use vim in browser, useful for sharelatex
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" An awesome fuzzy finder
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim'
" Asynchronous linting
Plug 'w0rp/ale'
"Stuff for snippets
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'
"Stuff for tab completion
"Plug 'ervandew/supertab'
"Stuff for autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Go development
Plug 'fatih/vim-go'
" Pug (Jade) development
Plug 'digitaltoad/vim-pug'
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
set ttimeoutlen=0          " Timeout for escape sequences

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

" Search into subfolders for tab completion
set path+=**

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
"
" Avoid modelines exploits
set modelines=0

" Use relative line numbers by default
set relativenumber

" Static word wrap
"set formatoptions+=cqt
set textwidth=72
set linebreak

" Indent behaviour

" Tabs are 4 spaces but don't expand tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab " Web programming
" set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab " Linux kernel

" Hide buffer instead of closing it. Avoid to save the file when :e is called
set hidden

" Flash instead of beep
set visualbell

" Fast mode in tty
set ttyfast

" Global %s by default
set gdefault

" Set english as default language
set spelllang=en

""------------------------------------------------------------
"" Ctags
""------------------------------------------------------------
command! MakeTags !ctags -R .

""------------------------------------------------------------
"" Appareance
""------------------------------------------------------------

set t_Co=256 " Enable 256 colors in vim

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

" Change between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Blink the matching line
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
	set invcursorline
	redraw
endfunction

""------------------------------------------------------------
"" Language specific: VHDL
""------------------------------------------------------------
autocmd FileType vhd setlocal shiftwidth=4 tabstop=4 noexpandtab
""------------------------------------------------------------

""------------------------------------------------------------
"" Language specific: Javascript
""------------------------------------------------------------
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab

"------------------------------------------------------------
"" Language specific: Pug
""------------------------------------------------------------
autocmd FileType pug setlocal shiftwidth=2 tabstop=2 expandtab
""------------------------------------------------------------

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
"
""------------------------------------------------------------
"" Language specific: tex
""------------------------------------------------------------
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 expandtab

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
"" Language specific: email
""------------------------------------------------------------
autocmd FileType mail setlocal formatoptions+=w

""------------------------------------------------------------
"" Language specific: python
""------------------------------------------------------------
autocmd FileType python setlocal
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ textwidth=79
      \ expandtab
      \ autoindent
      \ fileformat=unix

"===============================================================================
" ==== Maps ===
"
" Make witwith f9
map <f9> :make<CR>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Select text pasted
nnoremap <leader>v V`]

" Search the visual selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Highlight these by default in Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1

" Best guess jump for YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Save file
nnoremap <Leader>w :w<CR>

" Copy and paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Activate spell check with ,s
map <leader>s :set spell<CR>

" Delete file in current buffer but do not close tab or view
command Bd bp\|bd \#

" Exit terminal with esc
tnoremap <Esc> <C-\><C-n>

"===============================================================================
" === Plugins ===

"-------------------------------------------------------------------------------
" Neomake
" run when a file is saved
autocmd! BufWritePost * Neomake

""------------------------------------------------------------
"" Plugin - Ack.vim
""------------------------------------------------------------

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <C-P> :Ack

""------------------------------------------------------------
"" Plugin - FZF
""------------------------------------------------------------
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
" https://statico.github.io/vim3.html

"===============================================================================
" === Sources ===

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
