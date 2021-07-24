### From https://github.com/dylanaraps/pure-bash-bible
bwc() {
    # Usage: lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
