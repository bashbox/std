function remote::exists() {
	local _remote="$1";
	if curl --output /dev/null --silent --fail -r 0-0 "$_remote"; then {
		return 0;
	} else {
		return 1;
	} fi
}
