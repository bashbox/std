# Initial implementation that never made out even after being more dynamic due to performance thoughts.
# function log() {
# 	local _retcode="$?";
# 	local _args_count="$#";
	
# 	if test "$_args_count" -gt 1; then {
# 		local _type="$1";
# 	} fi
	
# 	if test -v "_type"; then {
# 		case "$_type" in
# 			"INFO")
# 				: "[%%%] \033[1;37minfo\033[0m";
# 			;;
# 			"WARN") 
# 				: "[***] \033[1;37mwarn\033[0m";
# 			;;
# 			"ERROR")
# 				: "[!!!] \033[1;31merror\033[0m";
# 			;;
# 		esac
# 		local _msg="$_"
# 		if test "${_type:-}" != "ERROR"; then {
# 			echo -e "${_msg}: $2"
# 		} else {
# 			if test "$_args_count" -eq 3 && [[ "${!_args_count}" =~ [0-9] ]]; then {
# 				_retcode="${!_args_count}";
# 			} fi
# 			local _source="${BB_ERR_SOURCE:-"${BASH_SOURCE[-1]}"}";
# 			>&2 echo -e "${_msg}[$_retcode]: ${_source}[$BASH_LINENO]: $2";
# 			return "$_retcode";
# 		} fi
# 	} else {
# 		echo -e "$1";
# 	} fi
	
# }

function log::info() {
	printf "[%%%] \033[1;37INFO\033[0m: %b%s%b\n" "$@";
}

function log::warn() {
	printf "[***] \033[1;37mWARN\033[0m: %b%s%b\n" "$@" >&2;
}

# log::error is internally provided by bashbox
