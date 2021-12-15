vim.cmd [[


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
]]
