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
nnoremap <C-W>t :tabnew <CR>
nnoremap <Leader><Backspace> :undo <CR>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>b :Unite buffer<CR>
nnoremap ` :
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
