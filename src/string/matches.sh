function string::matches() {
	local _string _match _arg;
	local _print=false;

	for _arg in "${@}"; do {
		case "$_arg" in
			--print|-p)
				shift;
				_print=true;
			;;
		esac
	} done

	# String == Regex
	if [[ $1 =~ $2 ]]; then {
		if [ "$_print" == "true" ]; then {
			echo "${BASH_REMATCH[@]}";
		} fi
		return 0;
	} else {
		return 1;
	} fi
}
