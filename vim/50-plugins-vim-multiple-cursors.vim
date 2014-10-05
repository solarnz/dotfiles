" Disable YouCompleteMe when using vim-multiple-cursors
"
function! Multiple_cursors_before()
    if exists('*youcompleteme#EnableCursorMovedAutocommands')
        call youcompleteme#DisableCursorMovedAutocommands()
    endif
endfunction

function! Multiple_cursors_after()
    if exists('*youcompleteme#EnableCursorMovedAutocommands')
        call youcompleteme#EnableCursorMovedAutocommands()
    endif
endfunction
