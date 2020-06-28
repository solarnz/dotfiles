function ec2_ssh {
    output=$(ec2-fzf ${@:1})
    if [[ -z "${output// }" ]]; then
        return
    fi

    cmd="tmux new-session"
    count=0
    while read -r line; do
        if [[ $count -gt 0 ]]; then
            cmd+=" split-window"
        fi
        cmd+=" 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $line' \;"
        cmd+=" select-layout tiled \;"
        count+=1
    done <<< "$output"

    cmd+=" setw synchronize-panes on \;"

    eval "$cmd"
}
