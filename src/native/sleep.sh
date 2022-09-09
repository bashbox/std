### From https://stackoverflow.com/a/47521066/11010941
sleep() {
    local IFS
    [[ -n "${_snore_fd:-}" ]] || { exec {_snore_fd}<> <(:); } 2>/dev/null ||
    {
        # workaround for MacOS and similar systems
        local fifo
        fifo=$(mktemp -u)
        mkfifo -m 700 "$fifo"
        exec {_snore_fd}<>"$fifo"
        rm "$fifo"
    }
    read ${1:+-t "$1"} -u $_snore_fd || :
}
