if [[ $(uname) == "Darwin" ]]; then
    PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/share/python/:/usr/local/share/npm/bin/:$PATH"

    alias find="gfind"
    alias tar="gtar"

    if [[ -x /usr/local/bin/gls ]]; then
        alias ls="gls --color=auto"
    fi
fi
