if [[ -e "$(which rg)" ]]; then
    export FZF_DEFAULT_COMMAND='rg --files'
fi
