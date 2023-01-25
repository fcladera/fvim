----------------------------------------
-- Plugins
----------------------------------------

-- Load packer as protected. Tip from chris@machine
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use popup window for packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Run packer
packer.startup(function(use)
  use 'wbthomason/packer.nvim'              -- Self management of packer
  use 'nvim-lua/plenary.nvim'               -- Lots of nvim-lua tools and functions.
  use 'nvim-lua/popup.nvim'                 -- Enable pop-up windows. This will not be required once the features are upstreamed.
  use 'neovim/nvim-lspconfig'               -- Language server protocol configuration. See lsp.lua for details
  use 'ayu-theme/ayu-vim'                   -- Template
  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'tpope/vim-surround'                  --  Better surround capabilities. Vim repeat allows to repeat these with .
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'                  -- Git related plugins
  use 'github/copilot.vim'                  -- Embrace AI or die
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'easymotion/vim-easymotion'           --  Ultra-fast motion in vim
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Better syntax highlighting using treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'            -- Additional textobjects for treesitter
  use { 'nvim-telescope/telescope.nvim',    -- Fuzzy Finder (files, lsp, etc)
    requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  use{'ms-jpq/coq_nvim', branch = 'coq'}    -- COQ autocompletion plugin
  use{'ms-jpq/coq.artifacts', branch = 'artifacts'}
  use{'ms-jpq/coq.thirdparty', branch = '3p'}
  use {'dpelle/vim-LanguageTool', opt = true, cmd = {'LanguageToolCheck'}}
  -- Setup packer if not installed
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- gitsigns config
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- lualine config
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'ayu',
    component_separators = '|',
    section_separators = '',
  },
}

-- indent_blankline config
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- telescope config
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- treesiter config
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'python' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- -- --  --  Writing tools
-- -- --  Plug 'https://github.com/dpelle/vim-LanguageTool'
-- -- ""------------------------------------------------------------
-- -- "" Plugin - LanguageTool
-- -- ""------------------------------------------------------------
-- let g:languagetool_jar="~/.local/share/LanguageTool/LanguageTool-5.2/languagetool-commandline.jar"
-- nmap <silent> <leader>c :LanguageToolCheck<CR>



