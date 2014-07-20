export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
alias j="jump"

#### Folder jumping / marking
function mark {
    mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _marks {
    reply=($(ls $MARKPATH))
}
compctl -K _marks jump
compctl -K _marks unmark
#### End folder jumping / marking


# vim:ft=zsh
