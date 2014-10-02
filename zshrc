for config in $(ls --color=none $HOME/.zsh/*.zsh | sort); do
    source $config
done
