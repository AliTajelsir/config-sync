" Mouse
set mouse=a

" Number column
set number
set numberwidth=1
highlight LineNr ctermbg=252 ctermfg=232

" Terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" Shortcuts
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

vnoremap <C-c> "+y
vnoremap <C-d> "+d
inoremap <C-v> <ESC>"+pa

map <C-s> :w<space>
