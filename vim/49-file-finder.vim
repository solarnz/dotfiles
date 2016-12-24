" If vim has ruby compiled in, then use CommandT. Otherwise, default to using
" unite for opening files.

nnoremap <Leader>t :Files<CR>

" Ignore retarded directories
set wildignore+=**/bower_components/**
set wildignore+=**/node_modules/**
set wildignore+=**/build/**
set wildignore+=*.pyc
