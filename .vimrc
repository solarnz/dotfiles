filetype off

if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

let g:neobundle#types#git#default_protocol = 'git'

NeoBundle 'gmarik/vundle'
NeoBundle 'git://git.wincent.com/command-t.git', {
\   'build': {
\       'mac': 'cd ruby/command-t; ruby extconf.rb; make',
\       'unix': 'cd ruby/command-t; ruby extconf.rb; make'
\   }
\}

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'solarnz/molokai'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jigish/vim-thrift'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'corntrace/bufexplorer'
NeoBundle 'rking/ag.vim'
NeoBundle 'davidhalter/jedi-vim'

NeoBundle 'Shougo/vimproc.vim', {
\     'build': {
\        'mac': 'make',
\        'unix': 'make'
\    }
\}

NeoBundle 'Shougo/unite.vim', {'depends': [ 'Shougo/vimproc.vim' ]}
NeoBundle 'itchyny/lightline.vim'

"CSS
NeoBundle "groenewege/vim-less"
NeoBundle "hail2u/vim-css3-syntax"

set encoding=utf-8
filetype plugin indent on
syntax on
set background=dark
colorscheme molokai
set autoindent

let mapleader="\\"
set viminfo='10,\"9900,:20,%,n~/.viminfo

set showmatch
set matchpairs=(:),{:},[:],<:>


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

"Show line numbers
set nu

" File types
au BufRead,BufNewFile *.thrift set filetype=thrift
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd h

"Extra highlighting settings
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhiteSpace ctermbg=52
setlocal spell spelllang=en_gb
hi SpellBad term=reverse ctermfg=white ctermbg=darkred

let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxFiles=999999
let g:CommandTMaxDepth=999999
let g:CommandTMaxCachedDirectories=10

" Ignore retarded directories
set wildignore+=build/*
set wildignore+=public/build/*
set wildignore+=exam/*
set wildignore+=*/.pyc

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

command! Wq wq
command! Sudow w !sudo tee %
command! Q q

" Always show the status bar at the bottom of the window
set laststatus=2
set incsearch
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set noshowmode
set list lcs=trail:·,tab:»·

let g:unite_source_history_yank_enable = 1

let g:tagbar_left = 1
let g:tagbar_sort = 0

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '>', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? ' ' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . '' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? ' '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
