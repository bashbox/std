function string::matches() {
	local _string _match;
	local _print=false;

	case "${@}" in
		--print|-p)
			shift;
			_print=true;
			;;
	esac

	if [[ $1 =~ $2 ]]; then {
		if [ "$_print" == "true" ]; then {
			echo "${BASH_REMATCH[@]}";
		} fi
		return 0;
	} else {
		return 1;
	} fi
}
