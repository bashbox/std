use std::process::get_temp;

function lockfile() {
	local name="$1";
	local lock_file;
	lock_file="$(get_temp::dir)/.${name}.lock";
	if test -e "$lock_file"; then {
		log::info "Waiting for another ${name} job to finish";
		until test ! -e "$lock_file" || ! { kill -0 "$(< "$lock_file")"; } 2>/dev/null; do {
			sleep 0.5;
		} done
	} fi
	printf '%s\n' "$$" > "$lock_file";
	# shellcheck disable=SC2064
	trap "rm -f '$lock_file' 2>/dev/null" EXIT;
}