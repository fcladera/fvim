----------------------------------------
-- Functions
----------------------------------------
vim.cmd [[

"" Clear trailing whitespaces from spf13
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"" Update fivm
function! UpdateFvim()
  PlugUpdate
  sleep 1
  PlugClean!
  sleep 1
  bd
endfunction

" Blink the matching line
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
	set invcursorline
	redraw
endfunction
]]
