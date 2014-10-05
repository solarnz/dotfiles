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
    let g:neobundle#install_process_timeout = 480
    call neobundle#rc(s:neobundle_dir)
endif

" Allow NeoBundle to update itself O.o
NeoBundleFetch 'Shougo/neobundle.vim'

if has('ruby')
    NeoBundle 'wincent/Command-T', {
    \   'build': {
    \       'mac': 'rake make',
    \       'unix': 'rake make'
    \   }
    \}
endif

NeoBundle 'godlygeek/tabular'
NeoBundle 'matze/vim-move'
NeoBundle 'mbbill/undotree'
NeoBundle 'rking/ag.vim'
NeoBundle 'solarnz/nerdcommenter'
NeoBundle 'Shougo/unite.vim', {'depends': [ 'Shougo/vimproc.vim' ]}
NeoBundle 'solarnz/unite-outline'
NeoBundle 'Shougo/unite-sudo'
NeoBundle 'Shougo/vimproc.vim', {
            \     'build': {
            \        'mac': 'make',
            \        'unix': 'make'
            \    }
            \}
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'zhaocai/DirDiff.vim'
NeoBundle 'junegunn/vim-easy-align' " A simple Vim alignment plugin
NeoBundle 'scrooloose/syntastic'
NeoBundle 'solarnz/arcanist.vim'
NeoBundle 'Valloric/YouCompleteMe', {
            \   'build': {
            \       'unix': './install.sh',
            \       'mac': './install.sh'
            \   }
            \}
NeoBundle 'marijnh/tern_for_vim', {
            \   'build': {
            \       'unix': 'npm install',
            \       'mac': 'npm install'
            \   }
            \}
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'solarnz/whitespace.vim'

" Theme / Looks
let g:solarnz_will_load_lightline = 1
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'junegunn/goyo.vim'

" Language plugins
NeoBundle 'solarnz/thrift.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle "groenewege/vim-less"
NeoBundle "hail2u/vim-css3-syntax"
NeoBundle "rodjek/vim-puppet"
NeoBundle "saltstack/salt-vim"
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'solarnz/python.vim'
NeoBundle 'PotatoesMaster/i3-vim-syntax'

if has('vim_starting') && s:install_neo_bundles == 1
    NeoBundleInstall
endif

set encoding=utf-8
filetype plugin indent on
syntax on
