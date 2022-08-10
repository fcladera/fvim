----------------------------------------
-- Basic configurations
----------------------------------------

-- Filetype detection and language-dependent indenting
-- FIXME: do not use vimscript syntax
if vim.fn.has('autocmd') then
  vim.cmd [[
    filetype plugin indent on
  ]]
end

-- Switches on syntax highlighting
-- FIXME: do not use vimscript syntax
if vim.fn.has('syntax') then
  vim.cmd [[
    syntax enable
  ]]
end

-- Prefer Unix based file format, only LF at end line
vim.o.fileformats = 'unix,dos'

-- Do smart autoindenting when starting a new line
vim.o.smartindent = true

-- Ignore case in search patterns unless upercase found
vim.o.ignorecase = true
vim.o.smartcase = true

-- Avoid numbers as 007 to be read as octal numbers
-- FIXME
-- vim.o.nrformats:remove('octal')

-- Timeout for escape sequences
vim.o.ttimeoutlen = 0

-- Show (partial) command in the last line of the screen
vim.o.showcmd = true

-- Number of lines above and below the cursor
vim.o.scrolloff = 1

--  Automatically reload files changed outside vim
vim.o.autoread = true

-- Long command history
vim.o.history = 1000

-- Split in a more natural way (right instead of below
vim.o.splitright = true

-- Show where the pattern matches while typing a search command
vim.o.incsearch = true

-- Highlight matches
vim.o.hlsearch = true

-- Match brackets briefly
vim.o.showmatch = true

-- Avoid modelines exploits
vim.o.modelines = 0

-- Use relative line numbers by default
vim.o.relativenumber = true

-- Static word wrap
-- "vim.o.formatoptions+=cqt
vim.o.textwidth = 80
vim.o.linebreak = true

-- Indent behaviour
-- Default tabs are 4 spaces but don't expand tabs
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Hide buffer instead of closing it. Avoid to save the file when :e is called
vim.o.hidden = true

-- Flash instead of beep
vim.o.visualbell = true
--
-- Fast mode in tty
vim.o.ttyfast = true

-- Global %s by default
vim.o.gdefault = true

-- English as default language
vim.o.spelllang = 'en'
