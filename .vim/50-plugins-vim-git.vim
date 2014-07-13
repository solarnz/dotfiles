" Automatically show the git diff when commiting.
" Also, disable neocomplete (as much as possible) while comitting.
" NOTE: I tired using NeoCompleteLock or NeoBundleDisable, but these functions
" are simply not aavailable at the time this code gets run.

autocmd FileType gitcommit DiffGitCached |
    \ wincmd L | wincmd h |
    \ let g:neocomplete#enable_auto_close_preview = 0 |
    \ let g:neocomplete#disable_auto_complete = 1
