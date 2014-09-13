for config in $(ls $HOME/.zsh/*.zsh | sort); do
    source $config
done
