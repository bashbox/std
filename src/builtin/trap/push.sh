use common;

function trap::push() {
  local new_trap="$1" && shift
  local sig
  for sig in $*; do
    local stack_name="$(trap::stack_name "$sig")"
    local old_trap=$(trap::get "$sig")
    eval "${stack_name}"'[${#'"${stack_name}"'[@]}]=$old_trap'
    # shellcheck disable=SC2064
    trap "${new_trap}" "$sig"
  done
}
