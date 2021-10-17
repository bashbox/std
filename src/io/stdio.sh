function io::stdio::to_file() {
	local _stdout_target="$1";
	local _stderr_target="$2";
	local _file;
	# Ensure to wipe out previously created files
	for _file in "$_stdout_target" "$_stderr_target"; do {
		if test -e "$_file"; then {
			rm "$_file";
		} fi
	} done
	# Main action
	STD_IO_PPID=$$ exec > >(while test -e "/proc/$STD_IO_PPID" && read -r ___stdout; do echo "$___stdout" && echo "$___stdout" >> "$_stdout_target"; done) \
		2> >(test -e "/proc/$STD_IO_PPID" && while read -r ___stderr >&2; do echo "$___stderr" && echo "$___stderr" >> "$_stderr_target"; done);
}
