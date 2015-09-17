""------------------------------------------------------------
"" Configurations before loading plugins
""------------------------------------------------------------

""------------------------------------------------------------
"" Loading Pathogen plugins
""------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

""------------------------------------------------------------
"" Basic configurations
""------------------------------------------------------------

set nocompatible " use vim instead of vi

""------------------------------------------------------------
"" Appareance
""------------------------------------------------------------

if has("gui_running")
  "set guioptions=r
  set guifont=DejaVu\ Sans\ Mono\ 16
endif

set background=dark
colorscheme jellybeans " colorschemes in .vim/bundle/vim-colorscheme

""------------------------------------------------------------
"" General key maps
""------------------------------------------------------------

""------------------------------------------------------------
"" Plugin - CtrlP
""------------------------------------------------------------
