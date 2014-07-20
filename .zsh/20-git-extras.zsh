if [[ ! -e $HOME/.git-extras ]]; then
    git clone https://github.com/visionmedia/git-extras $HOME/.git-extras
fi

if [[ -e $HOME/.git-extras ]]; then
    export PATH="$PATH:$HOME/.git-extras/bin"
    antigen bundle git-extras

    if [[ ! -e $HOME/.git-extras/man/man1 ]]; then
        ln -s $HOME/.git-extras/man $HOME/.git-extras/man/man1
    fi
fi
