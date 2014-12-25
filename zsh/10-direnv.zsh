export DIRENV=`which direnv`

if [[ -e "$DIRENV" ]]; then
    eval "$(direnv hook zsh)"
fi
