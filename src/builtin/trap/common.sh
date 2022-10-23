function trap::stack_name() {
  local sig=${1//[^a-zA-Z0-9]/_}
  printf '__trap_stack_%s\n' "$sig"
}

function trap::extract() {
  printf '%s\n' "${3:-}"
}

function trap::get() {
  eval "trap::extract $(trap -p "$1")"
}