function io::file::check_newline() {
	local _input="$1";
	if ! [[ $(tail -c1 "$_input" | wc -l) -gt 0 ]]; then {
		echo >> "$_input";
	} fi
}
