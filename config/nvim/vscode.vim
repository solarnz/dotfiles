augroup nopastemode
    autocmd InsertLeave * :set nopaste
augroup END

command! Wq wq
command! Sudow w !sudo tee %
command! Q q
command! W w

let mapleader='\'

set autoindent
set smartindent
set smarttab
set expandtab
set shiftround
set nojoinspaces
set nofoldenable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler
set scrolloff=20

" Set key shortcuts
set bs=2
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Open the tag definition in a vertical split window, off to the right.
nnoremap <silent> <Leader>] :vsp <CR><C-W>l<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <Leader>h <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
nnoremap <Leader>l <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
nnoremap <Leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <Leader>Q :wq<CR>
nnoremap <Leader><Backspace> :undo <CR>
nnoremap <Leader>b <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <Leader>e :NERDTreeFind<CR>
nnoremap <Leader>- :NERDTreeFind<CR>
nnoremap <Leader>t <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap tt <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap tr :action MoveEditorToOppositeTabGroup<CR>
nnoremap - <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap ` :

nnoremap \cc :action CommentByLineComment<CR>
vnoremap \cc :action CommentByLineComment<CR>

imap <C-n> <Action>(CodeCompletion)
nnoremap gi <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap gf <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>

"nnoremap gf :action ShowIntentionActions<CR>
"nnoremap gt :action RunContextGroup<CR>
"nnoremap tg :action HideSideWindows<CR>
"nnoremap tb :action ToggleLineBreakpoint<CR>
"nnoremap ti :action ToggleInlayHintsGloballyAction<CR>:action ForceRefresh<CR>
"nnoremap gp :action ActivateProblemsViewToolWindow<CR>
"nnoremap gu :action FindUsages<CR>
"nnoremap gr :action RefactoringMenu<CR>
"nnoremap gh :action ToggleInlineHintsAction <CR>
"nnoremap gb :action com.github.novotnyr.idea.git.BranchListActionGroup <CR>
"nnoremap g[ :action JumpToLastChange<CR>
"nnoremap g] :action JumpToNextChange<CR>
"nnoremap g= :action GotoNextError<CR>


" Easier window movement keys for the teck.
nnoremap tn <Cmd>call VSCodeNotify('workbench.action.splitEditorDown') <CR>
nnoremap tv <Cmd>call VSCodeNotify('workbench.action.splitEditorRight') <CR>

nnoremap th <Cmd>call VSCodeNotify('workbench.action.navigateLeft') <CR>
nnoremap tj <Cmd>call VSCodeNotify('workbench.action.navigateDown') <CR>
nnoremap tk <Cmd>call VSCodeNotify('workbench.action.navigateUp') <CR>
nnoremap tl <Cmd>call VSCodeNotify('workbench.action.navigateRight') <CR>

" Easy shortcut to switch back to normal mode
inoremap jj <esc>
inoremap jk <esc>

nnoremap fd :write <CR>

noremap      <F1>    <ESC>
inoremap     <F1>    <ESC>
vnoremap     <F1>    <ESC>
nnoremap     <F1>    <ESC>

noremap <Leader>m :noh <CR>

set showmode
set so=5
set nu

set showmatch
set matchpairs=(:),{:},[:],<:>

"Show line numbers
set number
set relativenumber
set hlsearch
set laststatus=2
set incsearch


" Hide the sidebar whenever neovim regains focus
autocmd WinEnter * call VSCodeNotify('workbench.action.closeSidebar')
