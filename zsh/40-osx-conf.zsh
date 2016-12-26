if [[ $(uname) == "Darwin" ]]; then
    PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/share/python/:/usr/local/share/npm/bin/:$PATH"

    if [[ -x "$(which gfind)" ]]; then
        alias find="gfind"
    fi

    if [[ -x "$(which gtar)" ]]; then
        alias tar="gtar"
    fi

    if [[ -x "$(which gls)" ]]; then
        alias ls="gls --color=auto"
    fi
fi
