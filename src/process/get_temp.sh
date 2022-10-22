function get_temp::file() {
	if test -w /tmp; then {
		printf '/tmp/%s\n' ".$$_$((RANDOM * RANDOM))";
	} elif res="$(mktemp -u)"; then {
		printf '%s\n' "$res" && unset res;
	} else {
		return 1;
	} fi
}

function get_temp::dir() {
	if test -w /tmp; then {
		printf '%s\n' '/tmp';
	} elif res="$(mktemp -u)"; then {
		printf '%s\n' "${res%/*}" && unset res;
	} else {
		return 1;
	} fi
}