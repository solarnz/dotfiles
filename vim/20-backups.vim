fun s:mkdir(path)
    let l:dir = expand(a:path)
    if !isdirectory(l:dir)
        call mkdir(l:dir)
    end
    return l:dir
endfunction

execute 'set backupdir=' . s:mkdir('~/.vim/backups//')
execute 'set directory=' . s:mkdir('~/.vim/swap//')

set backupcopy=yes
