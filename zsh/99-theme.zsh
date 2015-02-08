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

    #setopt noxtrace localoptions

    setopt promptsubst

    path_prompt="%B%F{$prompt_gentoo_prompt}%2~"
    PS1="$base_prompt$path_prompt %(1j.(%j).)%# $post_prompt"
    PS2="$base_prompt$path_prompt %_> $post_prompt"
    PS3="$base_prompt$path_prompt ?# $post_prompt"

}

prompt_gentoo_setup "$@"

setopt promptsubst

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{blue}[%b(%a)%F{blue}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{blue}[%b%F{blue}]%f '

zstyle ':vcs_info:*' enable git

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{%B%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# vim:ft=zsh
