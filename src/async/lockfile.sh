use box::process::get_temp;
use box::builtin::trap::append;

function lockfile() {
	
	local name="$1";
	local lock_file;
	lock_file="$(get_temp::dir)/.${name}.lock";

	# Print info when possible
	if test -e "$lock_file"; then {
		log::info "Awaiting for another ${name} job to finish";
	} fi

	# Await for an existing process
	while { kill -0 "$(< "$lock_file")"; } 2>/dev/null; do {
		sleep 0.5;
	} done

	# Await for locking
	until (set -o noclobber; printf '%s\n' "$$" > "$lock_file") 2>/dev/null; do {
		sleep 0.5;
	} done
	
	# shellcheck disable=SC2064
	trap::append "rm -f '$lock_file' 2>/dev/null" ${SIGNALS:-EXIT};

}
