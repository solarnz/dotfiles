autoload -U promptinit
promptinit

prompt_gentoo_setup () {
    prompt_gentoo_prompt=${1:-'blue'}
    prompt_gentoo_user=${2:-'green'}
    prompt_gentoo_root=${3:-'red'}

    if [ "$USER" = 'root' ]; then
        base_prompt="%B%F{$prompt_gentoo_root}%m%k "
    else
        base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
    fi

    post_prompt="%b%f%k"

    setopt promptsubst

    path_prompt="%B%F{$prompt_gentoo_prompt}%2~"
    PS1="$base_prompt$path_prompt %(1j.(%j).)%# $post_prompt"
    PS2="$base_prompt$path_prompt %_> $post_prompt"
    PS3="$base_prompt$path_prompt ?# $post_prompt"
}

prompt_gentoo_setup "$@"
setopt promptsubst

export RPROMPT=$'$(git_prompt_info)'

# Git prompt variables

export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✘%{$reset_color%}"


# vim:ft=zsh
