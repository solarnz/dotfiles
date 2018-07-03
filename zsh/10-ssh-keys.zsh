if [[ $SSH_CONNECTION == "" ]]; then
    eval `keychain --eval --agents gpg`
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# vim:ft=zsh
