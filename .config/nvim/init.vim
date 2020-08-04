" Mouse
set mouse=a

" Number column
set number
set numberwidth=1
highlight LineNr ctermbg=252 ctermfg=000

" Terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" shortcuts
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

map <C-s> :w<space>
