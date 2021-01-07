imap jk <Esc>
imap kj <Esc>
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Alternate way to save
nnoremap <M-w> :w<CR>
" Alternate way to quit
nnoremap <M-q> :q<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better indenting
vnoremap < <gv
vnoremap > >gv
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <Leader>o o<Esc>^Da
"nnoremap <Leader>O O<Esc>^Da
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>db :bdelete<CR>
