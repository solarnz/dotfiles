if [[ ! -e $HOME/.antigen.zsh ]]; then
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.zsh
fi

if [[ -e $HOME/.antigen.zsh ]]; then
    source $HOME/.antigen.zsh/antigen.zsh
    antigen use oh-my-zsh
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle git
    antigen bundle git-prompt
    antigen bundle git-remote-branch

    antigen apply
fi

# vim:ft=zsh
