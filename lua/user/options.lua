----------------------------------------
-- Basic configurations
----------------------------------------
vim.opt.backup = false                          -- creates a backup file
vim.o.cmdheight = 2                             -- Increase number of command lines
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.o.smartcase = true                          -- ...unless upercase found
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.o.ttimeoutlen = 0                           -- Time to wait for a key code sequence to complete
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.o.softtabstop = 2                           -- pressing tab will insert 2 spaces
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 3                          -- only the last window will always have a status line
vim.o.showcmd = true                            -- Show (partial) command in bottom of the screen
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.o.scrolloff = 5                             -- Number of lines above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.linebreak = true
vim.o.relativenumber = true                     -- Use relative line numbers by default
vim.o.fileformats = 'unix,dos'                  -- Unix based file format, only LF at end line
vim.o.autoread = true                           -- Reload files changed outside vim
vim.o.history = 1000                            -- Long command history
vim.o.incsearch = true                          -- Show pattern matches while typing
vim.o.showmatch = true                          -- Match brackets briefly
vim.o.modelines = 0                             -- Avoid modelines exploits
vim.o.textwidth = 80                            -- The 80 column police was here 🚓
vim.o.hidden = false                            -- Hide buffer instead of closing it.
vim.o.visualbell = true                         -- Flash instead of beep
vim.o.ttyfast = true                            -- Fast mode in tty
vim.o.gdefault = true                           -- Global %s by default
vim.o.spelllang = 'en'                          -- English as default language
vim.o.signcolumn = "yes"                        -- Alway draw the signcolumn

