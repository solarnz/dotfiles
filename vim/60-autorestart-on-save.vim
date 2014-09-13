augroup python_messaging
    autocmd BufWrite *.py :VimProcBang pkill 'start_messaging'
    autocmd BufWrite *.thrift :VimProcBang pkill 'start_messaging'
augroup END
