
" Ignore retarded directories
set wildignore+=**/bower_components/**
set wildignore+=**/node_modules/**
set wildignore+=**/build/**
set wildignore+=*.pyc

let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxFiles=999999
let g:CommandTMaxDepth=999999
let g:CommandTMaxCachedDirectories=10
let g:CommandTTraverseSCM="pwd"
