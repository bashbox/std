### From https://github.com/dylanaraps/pure-bash-bible
bdate() {
    # Usage: date "format"
    # See: 'man strftime' for format.
    printf "%($1)T\\n" "-1"
}
