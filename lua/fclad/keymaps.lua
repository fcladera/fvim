----------------------------------------
-- Keymaps
----------------------------------------
vim.g.mapleader = ","                                      -- Map leader to ,
vim.g.maplocalleader = ","                                 -- as well as localleader

local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("n", "<up>   ",  "<nop>", opts)                           -- Disable arrow keys
keymap("n", "<down> ",  "<nop>", opts)
keymap("n", "<left> ",  "<nop>", opts)
keymap("n", "<right>",  "<nop>", opts)
keymap("n", "<up>   ",  "<nop>", opts)
keymap("n", "<down> ",  "<nop>", opts)
keymap("n", "<left> ",  "<nop>", opts)
keymap("n", "<right>",  "<nop>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)                       -- Navigate in windows
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)              -- Resize windows
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)                   -- Change buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)

----------------------------------------
-- Shortcuts
----------------------------------------
keymap("n", "<leader>/", ":nohlsearch<CR>", opts)
keymap("n", "<leader>W", ":call StripTrailingWhitespace()<CR>", opts)
keymap("n", "<leader>F", ":call UpdateFvim()<CR>", opts)
keymap("n", "<leader>=", ":OnlineThesaurusCurrentWord<CR>", opts)
keymap("n", "<leader>s", ":set spell<CR>", opts)

-- Telescope shortcuts
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Other keymaps?
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

----------------------------------------
-- Commands
----------------------------------------
keymap("c", "WQ", "wq", {})  -- Avoid stupidity
keymap("c", "Wq", "wq", {})
keymap("c", "W", "w", {})

----------------------------------------
-- Telescope configs, move
----------------------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
