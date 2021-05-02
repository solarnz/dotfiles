if [[ ! -e $HOME/.zplug ]]; then
    git clone https://github.com/zplug/zplug $HOME/.zplug
fi

if [[ -e $HOME/.zplug ]]; then
    source $HOME/.zplug/init.zsh

    zplug 'zplug/zplug', hook-build:'zplug --self-manage'

    if ! zplug check; then
        zplug install
    fi

    export KUBE_PS1_ENABLED=off
    zplug 'jonmosco/kube-ps1', use:'kube-ps1.sh'


    # zplug breaks the ZSH job management.
    # See https://github.com/zplug/zplug/issues/374
    [ -f $_zplug_lock ] && rm $_zplug_lock

    zplug load
fi
