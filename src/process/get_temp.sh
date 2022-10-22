function get_temp::file() {
	if test -w /tmp; then {
		: "/tmp/.$$_$((RANDOM * RANDOM))";
	} elif res="$(mktemp -u)"; then {
		: "$res" && unset res;
	} else {
		return 1;
	} fi

	# Return (i.e. STDOUT)
	printf '%s\n' "$_";
}

function get_temp::dir() {
	if res="$(get_temp::file)"; then {
		printf '%s\n' "${res%/*}" && unset res;
	} else {
		return 1;
	} fi
}