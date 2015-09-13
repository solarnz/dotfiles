let mapleader="\\"

set autoindent
set smartindent
set smarttab
set expandtab
set shiftround
set nojoinspaces
set nofoldenable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set scrolloff=10

" Set key shortcuts
set bs=2
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Open the tag definition in a vertical split window, off to the right.
nnoremap <silent> <Leader>] :vsp <CR><C-W>l<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <Leader><Left> :tabprev <CR>
nnoremap <Leader>h :tabprev <CR>
nnoremap <Leader>l :tabnext <CR>
nnoremap <Leader><Right> :tabnext <CR>
nnoremap <Leader>n :tabnew <CR>
nnoremap <Leader>q :q <CR>
nnoremap <Leader>Q :wq<CR>
nnoremap <C-W>t :tabnew <CR>
nnoremap <Leader><Backspace> :undo <CR>

nnoremap ` :

" Easier window movement keys for the teck.
nnoremap tn :split <CR>
nnoremap tv :vsplit <CR>
nnoremap tr :tabnew <CR>

nnoremap th :wincmd h <CR>
nnoremap tj :wincmd j <CR>
nnoremap tk :wincmd k <CR>
nnoremap tl :wincmd l <CR>

" Disable the arrow keys
noremap    <Up>     <NOP>
noremap    <Down>   <NOP>
noremap    <Left>   <NOP>
noremap    <Right>  <NOP>
inoremap   <Up>     <NOP>
inoremap   <Down>   <NOP>
inoremap   <Left>   <NOP>
inoremap   <Right>  <NOP>
vnoremap   <Up>     <NOP>
vnoremap   <Down>   <NOP>
vnoremap   <Left>   <NOP>
vnoremap   <Right>  <NOP>

" Easy shortcut to switch back to normal mode
inoremap jj <esc>
inoremap jk <esc>

nnoremap fd :write <CR>

noremap      <F1>    <ESC>
inoremap     <F1>    <ESC>
vnoremap     <F1>    <ESC>
nnoremap     <F1>    <ESC>

noremap <Leader>m :noh <CR>
