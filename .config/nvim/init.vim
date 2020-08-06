" Mouse
set mouse=a

" Number column
set number
set numberwidth=1
highlight LineNr ctermbg=252 ctermfg=232

" Terminal
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" Dictionary
set dictionary+=/usr/share/dict/usa

" Shortcuts
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <C-r><C-o>+

noremap <F7> :setlocal spell spelllang=en_us<CR>
noremap <F19> :setlocal nospell<CR>

noremap <C-s> :w<space>
noremap <C-q> :q
