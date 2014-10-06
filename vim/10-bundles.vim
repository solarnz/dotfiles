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

" Command-T is my favorite file finder. Unfortunately it requires vim to be
" built with ruby support, so if that is not enabled, there is no point
" installing the plugin.
if has('ruby')
    NeoBundle 'wincent/Command-T', {
    \   'build': {
    \       'mac': 'rake make',
    \       'unix': 'rake make'
    \   }
    \}
endif

NeoBundle 'godlygeek/tabular'
NeoBundle 'matze/vim-move' " Visually move text around.
NeoBundle 'mbbill/undotree' " Shows the vim undo tree in a window.
NeoBundle 'rking/ag.vim' " Integrate ag with vim.
NeoBundle 'solarnz/nerdcommenter' " Easier commenting and uncommenting.
" The almighty unite.vim plugin.
NeoBundle 'Shougo/unite.vim', {'depends': [ 'Shougo/vimproc.vim' ]}
" My fork of the unite-outline plugin. I added support for the thrift
" language.
NeoBundle 'solarnz/unite-outline'
" Allows for running processes asynchronously.
NeoBundle 'Shougo/vimproc.vim', {
            \     'build': {
            \        'mac': 'make',
            \        'unix': 'make'
            \    }
            \}
" Easy replacement for areas of text. Quicker than writing a regular
" expression.
NeoBundle 'kristijanhusak/vim-multiple-cursors'
NeoBundle 'tpope/vim-eunuch' " Unix functions
NeoBundle 'tpope/vim-fugitive' " Git integration
NeoBundle 'tpope/vim-git' " Git syntax highlighting
NeoBundle 'tpope/vim-obsession' " Better session saving support
NeoBundle 'tpope/vim-speeddating' " Increments dates correctly
NeoBundle 'zhaocai/DirDiff.vim' " Allows you to diff directories
NeoBundle 'junegunn/vim-easy-align' " A simple Vim alignment plugin
NeoBundle 'scrooloose/syntastic' " Runs linters over your code
NeoBundle 'solarnz/arcanist.vim' " Arcanist syntax highlighting
" Awesome autocomplete functionality
NeoBundle 'Valloric/YouCompleteMe', {
            \   'build': {
            \       'unix': './install.sh',
            \       'mac': './install.sh'
            \   }
            \}
" Improved autocomplete functionality for javascript
NeoBundle 'marijnh/tern_for_vim', {
            \   'build': {
            \       'unix': 'npm install',
            \       'mac': 'npm install'
            \   }
            \}
NeoBundle 'editorconfig/editorconfig-vim' " Editor agnostic project settings
NeoBundle 'solarnz/whitespace.vim' " Remove trailing whitespace when saving

" Theme / Looks
let g:solarnz_will_load_lightline = 1
NeoBundle 'itchyny/lightline.vim' " The best statusbar plugin.
NeoBundle 'chriskempson/base16-vim' " The base16 color scheme for vim
NeoBundle 'junegunn/goyo.vim' " Distraction free editing

" Language plugins
NeoBundle 'solarnz/thrift.vim' " Thrift language support
NeoBundle 'pangloss/vim-javascript' " Javascript language support
NeoBundle 'lukaszb/vim-web-indent' " Better autoindentation for html and JS
NeoBundle 'jnwhiteh/vim-golang' " Golang language support
NeoBundle "groenewege/vim-less" " Less language support
NeoBundle "hail2u/vim-css3-syntax" " Css language support
NeoBundle "rodjek/vim-puppet" " Puppet language support
NeoBundle "saltstack/salt-vim" " Salt language suport
NeoBundle 'hynek/vim-python-pep8-indent' " Better python indentation support
NeoBundle 'solarnz/python.vim' " Python syntax highlighting
NeoBundle 'PotatoesMaster/i3-vim-syntax' " i3 configuration highlighting

if has('vim_starting') && s:install_neo_bundles == 1
    NeoBundleInstall
endif

set encoding=utf-8
filetype plugin indent on
syntax on
