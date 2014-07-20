if [[ $SSH_CONNECTION == "" ]]; then
    eval `keychain --eval keychain $(ls ~/.ssh | grep -v -e pub -e authorized_keys -e known_hosts -e config) `
fi

# vim:ft=zsh
