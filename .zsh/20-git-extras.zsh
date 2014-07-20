if [[ ! -e $HOME/.git-extras ]]; then
    git clone https://github.com/visionmedia/git-extras $HOME/.git-extras
fi

if [[ -e $HOME/.git-extras ]]; then
    export PATH="$PATH:$HOME/.git-extras/bin"
    antigen bundle git-extras
fi
