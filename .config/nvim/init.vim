" Use mouse
set mouse=a

" Custom color and width for number coulumn
set number
set numberwidth=1
highlight LineNr ctermbg=252 ctermfg=000

" Hide number column in terminal and start in insert mode
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" Custom shortcuts for buffers
noremap <A-/> :buffers<CR>:buffer<space>
noremap <A-.> :bnext<CR>
noremap <A-,> :bprevious<CR>

" Use system shortcuts for copy and paste
vnoremap <C-c> "+y
vnoremap <C-d> "+d
inoremap <C-v> <ESC>"+pa

" Use system shortcut for save as
map <C-s> :w<space>

" Restore terminal vertical bar when exiting neovim
autocmd VimLeave * set guicursor=a:ver35-blinkon0
