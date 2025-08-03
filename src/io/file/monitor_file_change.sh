function io::file::monitor_file_change() {
    local file="$1"
    if test -e "${file}"; then
        function watch_file() {
            tail -n 0 -F "${file}" 2>/dev/null | while read -r line; do
                break;
            done || true;
            watch_file & disown
        }
        watch_file & disown
    fi
}
