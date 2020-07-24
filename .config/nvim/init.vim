" Use mouse and system clipboard
set mouse=a
set clipboard=unnamedplus

" Custom color and width for number coulumn
set number
set numberwidth=1
highlight LineNr ctermbg=252 ctermfg=000

" Hide number column in terminal and start in insert mode
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert

" Cusom shortcuts for buffer
nnoremap <A-/> :buffers<CR>:buffer<space>
nnoremap <A-.> :bnext<CR>
nnoremap <A-,> :bprevious<CR>

" Use usual terminal shortcuts for copy and paste
vnoremap <C-S-c> "+y
vnoremap <C-S-v> "+p
vnoremap <C-S-x> "+d

" Use usual system shortcuts for save as
map <C-s> :w<space>

" Restore terminal vertical bar when exiting neovim
autocmd VimLeave * set guicursor=a:ver35-blinkon0
