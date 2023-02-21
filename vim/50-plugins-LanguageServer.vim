" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'go': ['~/go/bin/gopls'],
    \ 'rust': ['rls'],
    \ 'c': ['cquery'],
    \ 'php': ['/usr/bin/intelephense', '--stdio'],
    \ }

let g:LanguageClient_useFloatingHover = 1

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
vnoremap <F5> :call LanguageClient_contextMenu()<CR>

nnoremap tg :call LanguageClient_contextMenu()<CR>
vnoremap tg :call LanguageClient_contextMenu()<CR>

nnoremap tt :call LanguageClient_textDocument_hover()<CR>

let g:deoplete#enable_at_startup = 1
