"===============================================================================
" === Plugins ===
"===============================================================================
" We use vim-plug for plugin management
" https://github.com/junegunn/vim-plug

call plug#begin()
" Template
Plug 'ayu-theme/ayu-vim'
" Better surround capabilities. Vim repeat allows to repeat these with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Show Git modifications in vim
Plug 'mhinz/vim-signify'
" Ultra-fast motion in vim
Plug 'easymotion/vim-easymotion'
" An awesome fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Make from vim
Plug 'neomake/neomake'
" Asynchronous linting and fixing
Plug 'w0rp/ale'
" Autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Snippet completion
Plug 'SirVer/ultisnips'
" Programming language specific
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'vivien/vim-linux-coding-style'
Plug 'fatih/vim-go'
Plug 'digitaltoad/vim-pug' " Jade
Plug 'vhda/verilog_systemverilog.vim'
" Writing tools
Plug 'https://github.com/dpelle/vim-LanguageTool'
Plug 'lervag/vimtex'
Plug 'vim-scripts/loremipsum'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'reedes/vim-wordy'
call plug#end()

"===============================================================================
" === Configurations ===
"===============================================================================

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

" Default tabs are 4 spaces but don't expand tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab " Web programming

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

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" let ayucolor="dark"
" let g:gruvbox_contrast_dark = 'hard'
colorscheme OceanicNext

set list " List mode: shows spaces, tabs and nbsp in text with special characters
set listchars=tab:›\ ,trail:•,nbsp:+   "List mode configuration

set cursorline " Highlight current line

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
"" Language specific: ros launch files
""------------------------------------------------------------
autocmd BufRead,BufNewFile *.launch setfiletype xml

""------------------------------------------------------------
"" Language specific: python
""------------------------------------------------------------
autocmd FileType python setlocal
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ expandtab
      \ autoindent
      \ fileformat=unix

"===============================================================================
" === Functions ===
"===============================================================================

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

"===============================================================================
" === Maps ===
"===============================================================================

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

" Make witwith f9
map <f9> :make<CR>

" Select text pasted
nnoremap <leader>v V`]

" Search the visual selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

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

""------------------------------------------------------------
"" Command key maps
""------------------------------------------------------------

" Fix writing :Wq or :WQ to save and exit
command WQ wq
command Wq wq

""------------------------------------------------------------
"" Disabled key maps
""------------------------------------------------------------
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"===============================================================================
" === Plugins ===
"===============================================================================

""------------------------------------------------------------
"" Plugin - Neomake
""------------------------------------------------------------
autocmd! BufWritePost * Neomake


""------------------------------------------------------------
"" Plugin - vim-go
""------------------------------------------------------------
" Highlight these by default in Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1

""------------------------------------------------------------
"" Plugin - Deoplete
""------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

""------------------------------------------------------------
"" Plugin - FZF
""------------------------------------------------------------
nmap <leader><space> :Buffers<CR>
nmap <Leader>r :Files<CR>
nmap <Leader>t :Tags<CR>
" make FZF respect gitignore if 'rg' is installed
if (executable('rg'))
  let $FZF_DEFAULT_COMMAND = 'rg --hidden --ignore-file .git '
endif

""------------------------------------------------------------
"" Plugin - ale
""------------------------------------------------------------
" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000
let g:ale_fixers = {'python': ['autopep8', 'black', 'isort'], 'cpp': ['clang-format']}
let g:ale_linters = {'cpp': ['cpplint']}
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_python_flake8_options = '-m flake8 --max-line-length=88'
let g:ale_c_clangformat_options ='--style=Google'
let g:ale_fix_on_save = 1
nmap <silent> <leader>l :ALEFix<CR>

" use nice symbols for errors and warnings
" let g:ale_sign_error = '✗\ '
" let g:ale_sign_warning = '⚠\ '

""------------------------------------------------------------
"" Plugin - vimtex
""------------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method = "zathura"
let g:vimtex_quickfix_mode=0
" set conceallevel=1
let g:tex_conceal='abdmg'

""------------------------------------------------------------
"" Plugin - LanguageTool
""------------------------------------------------------------
let g:languagetool_jar="~/.local/share/LanguageTool/LanguageTool-5.2/languagetool-commandline.jar"
nmap <silent> <leader>c :LanguageToolCheck<CR>

""------------------------------------------------------------
"" Plugin - ultisnips
""------------------------------------------------------------
" " UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

"===============================================================================
" === Sources ===
"===============================================================================

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" https://statico.github.io/vim3.html
" https://castel.dev/post/lecture-notes-1/
