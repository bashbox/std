function get_temp_file() {
	if test -w /tmp; then {
		: "/tmp/.$$_$((RANDOM * RANDOM))";
	} elif res="$(mktemp -u)"; then {
		: "$res"
	} else {
		return 1;
	} fi

	# Return (i.e. STDOUT)
	printf '%s\n' "$_";
}