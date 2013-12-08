augroup python_messaging
    autocmd BufWrite *.py :VimProcBang pkill 'start_messaging'
    autocmd BufWrite *.thrift :VimProcBang pkill 'start_messaging'
augroup END

augroup nopastemode
    autocmd InsertLeave * :set nopaste
augroup END
