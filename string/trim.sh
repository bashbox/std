### From https://github.com/dylanaraps/pure-bash-bible
trim_leading_trailing() {
	local _stream="${1:-}";
	local _stdin;
	if test -z "${_stream}"; then {
		read -r _stdin;
		_stream="$_stdin";
	} fi

    # remove leading whitespace characters
    _stream="${_stream#"${_stream%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    _stream="${_stream%"${_stream##*[![:space:]]}"}"
    printf '%s\n' "$_stream"
}

# TODO below
trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}
