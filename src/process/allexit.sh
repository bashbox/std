function __allexit() {
	while read -r _pid; do {
		kill -9 "$_pid";
	} done < <(jobs -p)
}
trap '__allexit' EXIT
