filetype off

if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

let g:neobundle#types#git#default_protocol = 'git'

NeoBundle 'gmarik/vundle'
NeoBundle 'git://git.wincent.com/command-t.git', {
\   'build': {
\       'mac': 'cd ruby/command-t; ruby extconf.rb; make',
\       'unix': 'cd ruby/command-t; ruby extconf.rb; make'
\   }
\}

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'solarnz/molokai'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jigish/vim-thrift'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'corntrace/bufexplorer'
NeoBundle 'rking/ag.vim'
NeoBundle 'klen/python-mode'
NeoBundle 'matze/vim-move'

NeoBundle 'Shougo/vimproc.vim', {
\     'build': {
\        'mac': 'make',
\        'unix': 'make'
\    }
\}

NeoBundle 'Shougo/unite.vim', {'depends': [ 'Shougo/vimproc.vim' ]}
NeoBundle 'itchyny/lightline.vim'

"CSS
NeoBundle "groenewege/vim-less"
NeoBundle "hail2u/vim-css3-syntax"

set encoding=utf-8
filetype plugin indent on
syntax on
