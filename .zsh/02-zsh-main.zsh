bindkey -e

zstyle :compinstall filename "$HOME/.zsh/02-zsh-main.zsh"

autoload -U compinit
compinit
# End of lines added by compinstall

setopt autocd

autoload -U colors
colors

if [[ -x /usr/local/bin/gls ]]; then
    alias ls="gls --color=auto"
else
    alias ls="ls --color"
fi

if [[ $(uname) == "Darwin" ]]; then
    PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/share/python/:/usr/local/share/npm/bin/:$PATH"
    alias find="gfind"
    alias tar="gtar"
fi

if [[ $(uname) == "Linux" ]]; then
    export PATH=$PATH:~/bin:~/android-dev/android-sdk-linux_x86/platform-tools:~/android-dev/android-sdk-linux_x86/tools:/usr/share/java/apache-ant/bin:/usr/local/sbin
    export PATH="$PATH:/home/chris/.local/bin:/opt/vagrant/bin:/home/chris/arc/arcanist/bin:/home/chris/local/bin"
    export TERM=xterm-256color
fi


## work section ##

export ENVIRONMENT="staging-local"
## end work section ##

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

export VIRTUALENVWRAPPER_PYTHON=`which python2 || which python`
export WORKON_HOME=$HOME/virtual_envs
mkdir -p $WORKON_HOME
source `which virtualenvwrapper.sh`

if [[ -e $HOME/.zshrc_local ]]; then
    source $HOME/.zshrc_local
fi
