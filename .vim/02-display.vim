set background=dark
colorscheme molokai
set autoindent

set showmatch
set matchpairs=(:),{:},[:],<:>

"Show line numbers
set nu

" File types
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd h

"Extra highlighting settings
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhiteSpace ctermbg=52
setlocal spell spelllang=en_gb
hi SpellBad term=reverse ctermfg=white ctermbg=darkred

" Always show the status bar at the bottom of the window
set laststatus=2
set incsearch

set noshowmode
set list lcs=trail:·,tab:»·

let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"
