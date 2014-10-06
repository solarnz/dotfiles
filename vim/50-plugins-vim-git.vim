" Automatically show the git diff when running 'git commit'. If the commit
" window is not the first buffer opened, it will not show the diff panel. This
" is useful for using the Gstatus / Gcommit functions from the vim-fugitive
" plugin.


function s:open_diff_window()
    if bufnr('') == 1
        execute 'DiffGitCached | wincmd L | wincmd h'
    endif
endfunction

au BufRead COMMIT_EDITMSG call s:open_diff_window()
