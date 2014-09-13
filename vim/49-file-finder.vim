" If vim has ruby compiled in, then use CommandT. Otherwise, default to using
" unite for opening files.

if has('ruby')
    nnoremap <Leader>t :CommandT<CR>
else
    nnoremap <Leader>t :Unite file_rec/async<CR>
endif
