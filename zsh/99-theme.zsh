autoload -U promptinit
promptinit

prompt_gentoo_setup () {
    prompt_gentoo_prompt=${1:-'blue'}
    prompt_gentoo_user=${2:-'green'}
    prompt_gentoo_root=${3:-'red'}

    if [ "$USER" = 'root' ]
        then
        base_prompt="%B%F{$prompt_gentoo_root}%m%k "
        else
            base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
            fi
            post_prompt="%b%f%k"

#setopt noxtrace localoptions

setopt promptsubst

path_prompt="%B%F{$prompt_gentoo_prompt}%2~"
PS1="$base_prompt$path_prompt %(1j.(%j).)%# $post_prompt"
PS2="$base_prompt$path_prompt %_> $post_prompt"
PS3="$base_prompt$path_prompt ?# $post_prompt"
}

function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo \(${ref#refs/heads/}\)
}

function git_dirty_status() {
    if command git diff-index --quiet HEAD 2> /dev/null; then
        echo "%{$fg[green]%}"
    else
        echo "%{$fg[red]%}"
    fi
}

prompt_gentoo_setup "$@"
setopt promptsubst
export RPROMPT=$'${VIMODE}%B$(git_dirty_status)$(git_current_branch)%b%{$reset_color%}'


# vim:ft=zsh
