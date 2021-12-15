lua require('plug')
lua require('basic')

""------------------------------------------------------------
"" Basic configurations
""------------------------------------------------------------

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

set background=dark
let ayucolor="dark"
colorscheme ayu


set list " List mode: shows spaces, tabs and nbsp in text with special characters
set listchars=tab:›\ ,trail:•,nbsp:+   "List mode configuration

set cursorline " Highlight current line

"------------------------------------------------------------
" Language specific: C
"------------------------------------------------------------
" Force that all .c and .h files are C (and not cpp)
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

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
"" Language specific: C++
""------------------------------------------------------------
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2

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
set nolinebreak

""------------------------------------------------------------
"" Language specific: ros launch files
""------------------------------------------------------------
autocmd BufRead,BufNewFile *.launch setfiletype xml

""------------------------------------------------------------
"" Language specific: ros launch files
""------------------------------------------------------------
autocmd BufRead,BufNewFile *.launch setfiletype xml
" Force that all .v files are verilog
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.v set filetype=verilog
  set autoindent
augroup END

""------------------------------------------------------------
"" Language specific: python
""------------------------------------------------------------
" For python, extend the column limit to 88 chars to be compliant with the
" linter
autocmd FileType python setlocal
      \ textwidth=88
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

" Next buffer
nmap <silent> <C-Space> :bn<CR>

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
command W w

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
" Close preview window once that insert mode is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

""------------------------------------------------------------
"" Plugin - FZF
""------------------------------------------------------------
nmap <leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>

""------------------------------------------------------------
"" Plugin - ale
""------------------------------------------------------------
" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000
" let g:ale_fixers = {'python': ['autopep8', 'black', 'isort'], 'cpp': ['clang-format']}
let g:ale_fixers = {'python': ['autopep8', 'black', 'isort']}
let g:ale_linters = {'cpp': ['cpplint']}
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_python_flake8_options = '-m flake8 --max-line-length=88'
let g:ale_c_clangformat_options ='--style=Google'
let g:ale_fix_on_save = 0
nmap <leader>l :ALEFix<CR>

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
