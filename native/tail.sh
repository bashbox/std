### From https://github.com/dylanaraps/pure-bash-bible
btail() {
    # Usage: tail "n" "file"
    local _line;
    mapfile -tn 0 _line < "$2";
    printf '%s\n' "${_line[@]: -$1}";
}
