if [[ $(uname) == "Darwin" ]]; then
    if [[ $SSH_CONNECTION == "" ]]; then
        eval `keychain --eval --agents ssh`
    fi
else
    if [[ $SSH_CONNECTION == "" ]]; then
        eval `keychain --eval --agents gpg`
        export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi
fi

# vim:ft=zsh
