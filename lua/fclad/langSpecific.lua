-- Autocmds have not been implemented yet in neovim. We do it the old way insted
vim.cmd [[
"------------------------------------------------------------
" Language specific: C
"------------------------------------------------------------
" Force that all .c and .h files are C (and not cpp)
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
autocmd FileType c setlocal shiftwidth=4 tabstop=4 noexpandtab

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
]]
