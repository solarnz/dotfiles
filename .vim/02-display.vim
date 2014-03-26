set background=dark

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    " Well, not much I can do at the moment
endtry

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
set hlsearch

" Always show the status bar at the bottom of the window
set laststatus=2
set incsearch

" Don't show the mode if we are using lightline.
if exists('g:solarnz_will_load_lightline')
    set noshowmode
endif

set list lcs=trail:·,tab:»·

let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"
