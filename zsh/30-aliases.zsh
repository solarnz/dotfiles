alias gf="fg"
alias ll="ls -la"
alias l="ls -l"
alias sl="ls"

alias ls="ls --color"

if [[ -e "$(which exa)" ]]; then
    alias ls="exa"
fi

alias nose="nosetests --with-yanc --with-watcher"
