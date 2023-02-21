alias gf="fg"
alias ll="ls -la"
alias l="ls -l"
alias sl="ls"

if [[ $(uname) == "Darwin" ]]; then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi


alias fgc="git-fzf-git-checkout"
alias fdb="git-delete-branches"
