----------------------------------------
-- Appearence configurations
----------------------------------------

if vim.fn.exists('+termguicolors') then
  vim.cmd [[
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  ]]
end

vim.o.background = "dark"
vim.cmd [[
  let ayucolor="dark"
  colorscheme ayu
  set list " List mode: shows spaces, tabs and nbsp in text with special characters
  set listchars=tab:›\ ,trail:•,nbsp:+   "List mode configuration

  set cursorline " Highlight current line
]]



