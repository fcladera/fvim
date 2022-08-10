----------------------------------------
-- Basic configurations
----------------------------------------

vim.o.fileformats = 'unix,dos' -- Unix based file format, only LF at end line
vim.o.smartindent = true       -- Do smart autoindenting when starting a new line
vim.o.ignorecase = true        -- Ignore case in search patterns
vim.o.smartcase = true         -- ...unless upercase found
vim.o.ttimeoutlen = 0          -- Time to wait for a key code sequence to complete
vim.o.showcmd = true           -- Show (partial) command in bottom of the screen
vim.o.scrolloff = 5            -- Number of lines above and below the cursor
vim.o.autoread = true          -- Reload files changed outside vim
vim.o.history = 1000           -- Long command history
vim.o.splitright = true        -- Split in a more natural way
vim.o.incsearch = true         -- Show pattern matches while typing
vim.o.hlsearch = true          -- Highlight matches
vim.o.showmatch = true         -- Match brackets briefly
vim.o.modelines = 0            -- Avoid modelines exploits
vim.o.relativenumber = true    -- Use relative line numbers by default
vim.o.textwidth = 80           -- The 80 column police was here 🚓
vim.o.linebreak = true         -- Static line beak
vim.o.tabstop = 2              -- Tabs are counted as 2 spaces
vim.o.softtabstop = 2          -- pressing tab will insert 2 spaces
vim.o.expandtab = true         -- Complementary with softtabstop
vim.o.shiftwidth = 2           -- autoindent will insert 2 spaces
vim.o.hidden = true            -- Hide buffer instead of closing it.
vim.o.visualbell = true        -- Flash instead of beep
vim.o.ttyfast = true           -- Fast mode in tty
vim.o.gdefault = true          -- Global %s by default
vim.o.spelllang = 'en'         -- English as default language
