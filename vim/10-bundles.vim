filetype off

if &compatible
    set nocompatible
endif

" Install the bundles after we have installed neo bundle
let s:install_plugins = 0

if has('nvim')
    let s:plugin_dir = expand('~/.vim/nvim_bundles')
else
    let s:plugin_dir = expand('~/.vim/vim_bundles')
endif

" Install dein.vim - The hard way, without using submodules!
if has('vim_starting')

    " Clone and or Load dein.vim
    if isdirectory('bundle/repos/github.com/Shougo/dein.vim')
        set runtimepath^=bundle/repos/github.com/Shougo/dein.vim
    elseif finddir('dein.vim', '.;') != ''
        execute 'set runtimepath^=' . finddir('dein.vim', '.;')
    elseif &runtimepath !~ '/dein.vim'
        if !isdirectory(s:plugin_dir.'/repos/github.com/Shougo/dein.vim')
            execute printf('!git clone %s://github.com/Shougo/dein.vim.git',
                        \ (exists('$http_proxy') ? 'https' : 'git'))
                        \ s:plugin_dir.'/repos/github.com/Shougo/dein.vim'
            let s:install_plugins = 1
        endif

        execute 'set runtimepath^=' . s:plugin_dir.'/repos/github.com/Shougo/dein.vim'
    endif

endif

call dein#begin(s:plugin_dir)

" Allow dein.vim to update itself O.o
call dein#add('Shougo/dein.vim')

call dein#add('godlygeek/tabular')
call dein#add('matze/vim-move') " Visually move text around.
call dein#add('mbbill/undotree') " Shows the vim undo tree in a window.
call dein#add('solarnz/nerdcommenter') " Easier commenting and uncommenting.
" Easy replacement for areas of text. Quicker than writing a regular
" expression.
call dein#add('kristijanhusak/vim-multiple-cursors')
call dein#add('tpope/vim-eunuch') " Unix functions
call dein#add('tpope/vim-fugitive') " Git integration
call dein#add('tpope/vim-git') " Git syntax highlighting
call dein#add('tpope/vim-obsession') " Better session saving support
call dein#add('tpope/vim-speeddating') " Increments dates correctly
call dein#add('tpope/vim-vinegar') " Improves netrw
call dein#add('zhaocai/DirDiff.vim') " Allows you to diff directories
call dein#add('junegunn/vim-easy-align') " A simple Vim alignment plugin
call dein#add('solarnz/arcanist.vim') " Arcanist syntax highlighting
call dein#add('Shougo/deoplete.nvim')
call dein#add('editorconfig/editorconfig-vim') " Editor agnostic project settings
call dein#add('solarnz/whitespace.vim') " Remove trailing whitespace when saving
call dein#add('solarnz/committia.vim') " Show a differential when doing git commit
call dein#add('junegunn/vim-peekaboo') " Show register values
call dein#add('chrisbra/vim-diff-enhanced') " Better differential algorithms
call dein#add('vimwiki/vimwiki')
call dein#add('tpope/vim-surround')

call dein#add('junegunn/fzf', {'merged': 0})
call dein#add('junegunn/fzf.vim')

" Theme / Looks
let g:solarnz_will_load_lightline = 1
call dein#add('itchyny/lightline.vim') " The best statusbar plugin.
call dein#add('chriskempson/base16-vim') " The base16 color scheme for vim
call dein#add('junegunn/goyo.vim') " Distraction free editing

" Language plugins
call dein#add("groenewege/vim-less") " Less language support
call dein#add("hail2u/vim-css3-syntax") " Css language support
call dein#add("rodjek/vim-puppet") " Puppet language support
call dein#add('PotatoesMaster/i3-vim-syntax') " i3 configuration highlighting
call dein#add('fatih/vim-go') " Golang language support
call dein#add('hynek/vim-python-pep8-indent') " Better python indentation support
call dein#add('kchmck/vim-coffee-script') " Coffee script language support
call dein#add('markcornick/vim-terraform')
call dein#add('othree/html5.vim')
call dein#add('pangloss/vim-javascript') " Javascript language support
call dein#add('mxw/vim-jsx')
call dein#add('shime/vim-livedown')
call dein#add('solarnz/nagios.vim') " Nagios syntax highlighting
call dein#add('solarnz/python.vim') " Python syntax highlighting
call dein#add('solarnz/thrift.vim') " Thrift language support
call dein#add('vim-ruby/vim-ruby')
call dein#add('wting/rust.vim') " Rust language support

call dein#end()

if has('vim_starting') && s:install_plugins == 1
    call dein#install()
endif

set encoding=utf-8
filetype plugin indent on
syntax on
