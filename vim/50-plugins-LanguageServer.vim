" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'go': ['gopls'],
    \ 'php': ['php-language-server'],
    \ 'rust': ['rls'],
    \ 'c': ['cquery'],
    \ }

let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_hoverPreview = "Never"

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
vnoremap <F5> :call LanguageClient_contextMenu()<CR>

nnoremap tg :call LanguageClient_contextMenu()<CR>
vnoremap tg :call LanguageClient_contextMenu()<CR>

let g:deoplete#enable_at_startup = 1
