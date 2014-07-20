bindkey -e

zstyle :compinstall filename "$HOME/.zsh/02-zsh-main.zsh"

autoload -U compinit
compinit
# End of lines added by compinstall

setopt autocd

autoload -U colors
colors

export PATH="$HOME/.local/bin:$PATH"

export EDITOR=vim

autoload -U autocd
setopt autocd
setopt extendedglob
zstyle ':completion:*' menu select

export VIRTUAL_ENV_DISABLE_PROMPT=1


#### Begin AWS environment selection

export AWSPATH=$HOME/.aws

function aws {
    source $AWSPATH/$1
}

function _aws_envs {
    reply=($(ls $AWSPATH))
}
compctl -K _aws_envs aws

#### End AWS environment selection


if [[ -e $HOME/.zshrc_local ]]; then
    source $HOME/.zshrc_local
fi
