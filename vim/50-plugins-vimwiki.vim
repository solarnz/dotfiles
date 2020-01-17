let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

nnoremap <Leader>we :e ~/vimwiki/<CR>

au FocusGained,BufEnter */vimwiki/* :silent! !
au FocusLost,WinLeave */vimwiki/* :w
