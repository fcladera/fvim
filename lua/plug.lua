----------------------------------------
-- Plugins
----------------------------------------
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

--  Template
Plug 'ayu-theme/ayu-vim'
--  Better surround capabilities. Vim repeat allows to repeat these with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
--  Git-related plugins
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
--  Ultra-fast motion in vim
Plug 'easymotion/vim-easymotion'
Plug 'neovim/nvim-lspconfig'
--  An awesome fuzzy finder
-- --  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- --  Plug 'junegunn/fzf.vim'
-- --  --  Make from vim
-- --  Plug 'neomake/neomake'
-- --  --  Asynchronous linting and fixing
-- --  Plug 'w0rp/ale'
-- --  --  Autocompletion
-- --  if has('nvim')
-- --    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
-- --  else
-- --    Plug 'Shougo/deoplete.nvim'
-- --    Plug 'roxma/nvim-yarp'
-- --    Plug 'roxma/vim-hug-neovim-rpc'
-- --  endif
-- --  --  Snippet completion
-- --  Plug 'SirVer/ultisnips'
-- --  --  Programming language specific
-- --  Plug 'elzr/vim-json'
-- --  Plug 'pangloss/vim-javascript'
-- --  -- Plug 'vivien/vim-linux-coding-style'
-- --  Plug 'fatih/vim-go'
-- --  Plug 'digitaltoad/vim-pug' --  Jade
-- --  Plug 'vhda/verilog_systemverilog.vim'
-- --  --  Writing tools
-- --  Plug 'https://github.com/dpelle/vim-LanguageTool'
-- --  Plug 'lervag/vimtex'
-- --  Plug 'vim-scripts/loremipsum'
-- --  Plug 'beloglazov/vim-online-thesaurus'
-- --  Plug 'reedes/vim-wordy'
vim.call('plug#end')
