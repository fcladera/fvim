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
Plug 'glepnir/lspsaga.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
-- TODO: Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
--  An awesome fuzzy finder
-- --  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- --  Plug 'junegunn/fzf.vim'
-- ""------------------------------------------------------------
-- "" Plugin - FZF
-- ""------------------------------------------------------------
-- nmap <leader>b :Buffers<CR>
-- nmap <Leader>f :Files<CR>
-- nmap <Leader>t :Tags<CR>
--
-- --  --  Make from vim
-- --  Plug 'neomake/neomake'
-- --  --  Asynchronous linting and fixing
-- --  Plug 'w0rp/ale'

-- ""------------------------------------------------------------
-- "" Plugin - ale
-- ""------------------------------------------------------------
-- " lint after 1000ms after changes are made both on insert mode and normal mode
-- let g:ale_lint_on_text_changed = 'always'
-- let g:ale_lint_delay = 1000
-- " let g:ale_fixers = {'python': ['autopep8', 'black', 'isort'], 'cpp': ['clang-format']}
-- let g:ale_fixers = {'python': ['autopep8', 'black', 'isort']}
-- let g:ale_linters = {'cpp': ['cpplint']}
-- let g:ale_warn_about_trailing_whitespace = 1
-- let g:ale_python_flake8_options = '-m flake8 --max-line-length=88'
-- let g:ale_c_clangformat_options ='--style=Google'
-- let g:ale_fix_on_save = 0
-- nmap <leader>l :ALEFix<CR>
--

-- --  --  Autocompletion
-- --  -- ""------------------------------------------------------------
-- --  -- "" Plugin - Deoplete
-- --  -- ""------------------------------------------------------------
-- --  -- let g:deoplete#enable_at_startup = 1
-- --  -- " Close preview window once that insert mode is done
-- --  -- autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
-- --  if has('nvim')
-- --    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
-- --  else
-- --    Plug 'Shougo/deoplete.nvim'
-- --    Plug 'roxma/nvim-yarp'
-- --    Plug 'roxma/vim-hug-neovim-rpc'
-- --  endif
--
-- --  --  Snippet completion
-- --  Plug 'SirVer/ultisnips'
-- --  --  Programming language specific
-- --  Plug 'elzr/vim-json'
-- --  Plug 'pangloss/vim-javascript'
-- --  -- Plug 'vivien/vim-linux-coding-style'
-- --  Plug 'digitaltoad/vim-pug' --  Jade
-- --  Plug 'vhda/verilog_systemverilog.vim'

-- --  --  Writing tools
-- --  Plug 'https://github.com/dpelle/vim-LanguageTool'
-- ""------------------------------------------------------------
-- "" Plugin - LanguageTool
-- ""------------------------------------------------------------
-- let g:languagetool_jar="~/.local/share/LanguageTool/LanguageTool-5.2/languagetool-commandline.jar"
-- nmap <silent> <leader>c :LanguageToolCheck<CR>

-- --  Plug 'lervag/vimtex'
-- ""------------------------------------------------------------
-- "" Plugin - vimtex
-- ""------------------------------------------------------------
-- let g:tex_flavor='latex'
-- let g:vimtex_view_method = "zathura"
-- let g:vimtex_quickfix_mode=0
-- " set conceallevel=1
-- let g:tex_conceal='abdmg'

-- --  Plug 'vim-scripts/loremipsum'
-- --  Plug 'beloglazov/vim-online-thesaurus'
-- --  Plug 'reedes/vim-wordy'
vim.call('plug#end')
