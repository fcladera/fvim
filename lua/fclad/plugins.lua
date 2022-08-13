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
-- Language server protocol configuration. See lsp.lua for details
Plug 'neovim/nvim-lspconfig'
-- TODO finish this configuration
Plug 'glepnir/lspsaga.nvim'
-- Enable pop-up windows. This will not be required once the features are upstreamed
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
-- Better syntax highlighting using treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
-- Telescope window for finding things
Plug 'nvim-telescope/telescope.nvim'
-- COQ autocompletion plugin
Plug('ms-jpq/coq_nvim', {['branch'] = 'coq'})
Plug('ms-jpq/coq.artifacts', {['branch'] = 'artifacts'})
Plug('ms-jpq/coq.thirdparty', {['branch'] = '3p'})
-- ALE. TODO: change this with something faster
Plug 'w0rp/ale'
vim.call('plug#end')

vim.cmd [[
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
]]

-- --  --  Writing tools
-- --  Plug 'https://github.com/dpelle/vim-LanguageTool'
-- ""------------------------------------------------------------
-- "" Plugin - LanguageTool
-- ""------------------------------------------------------------
-- let g:languagetool_jar="~/.local/share/LanguageTool/LanguageTool-5.2/languagetool-commandline.jar"
-- nmap <silent> <leader>c :LanguageToolCheck<CR>



