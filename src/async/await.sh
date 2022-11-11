use box::native::sleep;

function await::until_true() {
	local time="${TIME:-0.5}";
	local input=("$@");
	until "${input[@]}"; do {
		sleep "$time"
	} done
}

function await::while_true() {
	local time="${TIME:-0.5}";
	local input=("$@");
	while "${input[@]}"; do {
		sleep "$time"
	} done
}

function await::for_file_existence() {
	local file="$1";
	await::until_true test -e "$file";
}

function await::signal() {
	local kind="$1";
	local target="$2";
	local status_file="/tmp/.asignal_${target}";

	case "$kind" in
		"get")
			until test -s "$status_file"; do {
				sleep 0.2;
			} done
		;;
		send)
			printf 'done\n' >> "$status_file";
		;;
	esac
}

