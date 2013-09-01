filetype off

" Setup NeoBundle - The hard way, without using submodules!
if has('vim_starting')
    " Install the bundles after we have installed neo bundle
    let s:install_neo_bundles = 0

    " Clone and or Load NeoBundle
    let s:neobundle_dir = expand('~/.vim/bundle')
    if isdirectory('neobundle.vim')
        set runtimepath^=neobundle.vim
    elseif finddir('neobundle.vim', '.;') != ''
        execute 'set runtimepath^=' . finddir('neobundle.vim', '.;')
    elseif &runtimepath !~ '/neobundle.vim'
        if !isdirectory(s:neobundle_dir.'/neobundle.vim')
            execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
                        \ (exists('$http_proxy') ? 'https' : 'git'))
                        \ s:neobundle_dir.'/neobundle.vim'
            let s:install_neo_bundles = 1
        endif

        execute 'set runtimepath^=' . s:neobundle_dir.'/neobundle.vim'
    endif

    let g:neobundle#enable_tail_path = 1
    let g:neobundle#types#git#default_protocol = 'git'
    call neobundle#rc(s:neobundle_dir)
endif

" Allow NeoBundle to update itself O.o
NeoBundleFetch 'Shougo/neobundle.vim'

if has('ruby')
    NeoBundle 'git://git.wincent.com/command-t.git', {
    \   'build': {
    \       'mac': 'cd ruby/command-t; ruby extconf.rb; make',
    \       'unix': 'cd ruby/command-t; ruby extconf.rb; make'
    \   }
    \}
endif

NeoBundle 'majutsushi/tagbar'
NeoBundle 'matze/vim-move'
NeoBundle 'mbbill/undotree'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim', {'depends': [ 'Shougo/vimproc.vim' ]}
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc.vim', {
            \     'build': {
            \        'mac': 'make',
            \        'unix': 'make'
            \    }
            \}
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-speeddating'

" Theme / Looks
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'solarnz/molokai'

" Language plugins
NeoBundle 'jigish/vim-thrift'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'klen/python-mode'
NeoBundle "groenewege/vim-less"
NeoBundle "hail2u/vim-css3-syntax"

if has('vim_starting') && s:install_neo_bundles == 1
    NeoBundleInstall
endif

set encoding=utf-8
filetype plugin indent on
syntax on
