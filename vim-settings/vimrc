syntax on
" enable omnicomplete for each filetype as appropriate

filetype plugin on
filetype indent on
" enable line numbering

set background=dark

set hls

" tab stuff
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" ctrl + right/left = next/prev tab
nnoremap <C-Right> :tabn<CR>
nnoremap <C-Left> :tabp<CR>

" shift + right/left = next/prev window (when split)
nnoremap <S-Left> <C-w><Left>
nnoremap <S-Right> <C-w><Right>

" open file tree, close file tree

nnoremap <C-F> :NERDTree<CR>
nnoremap <C-H> :NERDTreeClose<CR>


map ,x :bd<CR>
map ,vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>
map ,r :r <C-R>=expand("%:p:h") . "/" <CR>

" open the currently highlighted file
map ,o <C-w>f<C-w>L
"
