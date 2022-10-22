use std::process::get_temp;

function lockfile() {
	local name="$1";
	local lock_file;
	lock_file="$(get_temp::dir)/.${name}.lock";
	if test -e "$lock_file"; then {
		until test ! -e "$lock_file" || ! { kill -0 "$(< "$lock_file")"; } 2>/dev/null; do {
			sleep 0.5;
		} done
	} fi
	printf '%s\n' "$$" > "$lock_file";
	printf '%s\n' "$lock_file"; # Return the lockfile path for handling cleanup
}