set background=dark
colorscheme molokai
set autoindent

set showmatch
set matchpairs=(:),{:},[:],<:>

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
