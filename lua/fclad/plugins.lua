----------------------------------------
-- Plugins
----------------------------------------
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Self management of packer
  use 'ayu-theme/ayu-vim'  --  Template
  use 'tpope/vim-surround' --  Better surround capabilities. Vim repeat allows to repeat these with .
  use 'tpope/vim-repeat'
  use 'mhinz/vim-signify'  --  Git-related plugins
  use 'tpope/vim-fugitive'
  use 'easymotion/vim-easymotion' --  Ultra-fast motion in vim
  use 'neovim/nvim-lspconfig' -- Language server protocol configuration. See lsp.lua for details
  -- TODO finish this configuration
  use 'glepnir/lspsaga.nvim'
  -- Enable pop-up windows. This will not be required once the features are upstreamed
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Better syntax highlighting using treesitter
  -- Telescope window for finding things
  use 'nvim-telescope/telescope.nvim'
  -- COQ autocompletion plugin
  use{'ms-jpq/coq_nvim', branch = 'coq'}
  use{'ms-jpq/coq.artifacts', branch = 'artifacts'}
  use{'ms-jpq/coq.thirdparty', branch = '3p'}
  -- ALE. TODO: change this with something faster
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
end)

--vim.cmd [[
--let g:ale_lint_on_text_changed = 'always'
--let g:ale_lint_delay = 1000
--" let g:ale_fixers = {'python': ['autopep8', 'black', 'isort'], 'cpp': ['clang-format']}
--let g:ale_fixers = {'python': ['autopep8', 'black', 'isort']}
--let g:ale_linters = {'cpp': ['cpplint']}
--let g:ale_warn_about_trailing_whitespace = 1
--let g:ale_python_flake8_options = '-m flake8 --max-line-length=88'
--let g:ale_c_clangformat_options ='--style=Google'
--let g:ale_fix_on_save = 0
--nmap <leader>l :ALEFix<CR>
--]]

-- -- --  --  Writing tools
-- -- --  Plug 'https://github.com/dpelle/vim-LanguageTool'
-- -- ""------------------------------------------------------------
-- -- "" Plugin - LanguageTool
-- -- ""------------------------------------------------------------
-- let g:languagetool_jar="~/.local/share/LanguageTool/LanguageTool-5.2/languagetool-commandline.jar"
-- nmap <silent> <leader>c :LanguageToolCheck<CR>



