termtitle() {
    case "$TERM" in
        rxvt*|xterm|xterm-*|nxterm|gnome|screen|screen-*)
            local prompt_host="${(%):-%m}"
            local prompt_user="${(%):-%n}"
            local prompt_char="${(%):-%~}"
            case "$1" in
                precmd)
                    printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
                preexec)
                    printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
            esac
        ;;
    esac
}

precmd() {
    # Set terminal title.
    termtitle precmd
}

preexec() {
    # Set terminal title along with current executed command pass as second argument
    termtitle preexec "${(V)1}"
}
