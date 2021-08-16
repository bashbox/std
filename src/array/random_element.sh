### From https://github.com/dylanaraps/pure-bash-bible
array::random_element() {
    # Usage: random_array_element "array"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}
