" Basic settings
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
set scrolloff=20
set bs=2
set showmode
set so=5
set nu
set number
set relativenumber
set hlsearch
set laststatus=2
set incsearch
set showmatch
set matchpairs=(:),{:},[:],<:>

" Leader key configuration
let mapleader='\'

" Basic commands
command! Wq wq
command! Q q
command! W w

" VSCode-specific mappings
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :wq<CR>
nnoremap <Leader><Backspace> :undo<CR>
nnoremap <Leader>b :tabnext<CR>
nnoremap <Leader>t :vsc workbench.action.findInFiles<CR>
nnoremap tt :vsc workbench.action.findInFiles<CR>
nnoremap - :vsc workbench.view.explorer<CR>
autocmd FocusGained * :vsc workbench.action.closeSidebar<CR>
nnoremap ` :

" Code actions and navigation
nnoremap gi :vsc editor.action.showHover<CR>
nnoremap gf :vsc editor.action.quickFix<CR>

" Window management
nnoremap tn :vsc workbench.action.splitEditorDown<CR>
nnoremap tv :vsc workbench.action.splitEditorRight<CR>
nnoremap th :vsc workbench.action.navigateLeft<CR>
nnoremap tj :vsc workbench.action.navigateDown<CR>
nnoremap tk :vsc workbench.action.navigateUp<CR>
nnoremap tl :vsc workbench.action.navigateRight<CR>

" Quick escape mappings
inoremap jj <esc>
inoremap jk <esc>
nnoremap fd :write<CR>

" F1 to ESC mappings
noremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" Clear search highlighting
nnoremap <Leader>m :noh<CR>
