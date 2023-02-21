augroup nopastemode
    autocmd InsertLeave * :set nopaste
augroup END

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

autocmd BufRead,BufNewFile /Users/christrotman/work/dynamic-config/**/*.json set filetype=jsonc
