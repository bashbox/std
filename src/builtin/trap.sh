# Adapted for bashbox from https://stackoverflow.com/a/16115145/11010941

trap::stack_name() {
  local sig=${1//[^a-zA-Z0-9]/_}
  printf '__trap_stack_%s\n' "$sig"
}

trap::extract() {
  printf '%s\n' "${3}"
}

trap::get() {
  eval "trap::extract $(trap -p "$1")"
}

trap::push() {
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

trap::pop() {
  local sig
  for sig in $*; do
    local stack_name="$(trap::stack_name "$sig")"
    local count; eval 'count=${#'"${stack_name}"'[@]}'
    if [[ $count -lt 1 ]]; then return 127; fi
    local new_trap
    local ref="${stack_name}"'[${#'"${stack_name}"'[@]}-1]'
    local cmd='new_trap=${'"$ref}"; eval $cmd
    # shellcheck disable=SC2064
    trap "${new_trap}" "$sig"
    eval "unset $ref"
  done
}

trap::prepend() {
  local new_trap="$1" && shift
  local sig
  for sig in $*; do
    if [[ -z "$(trap::get "$sig")" ]]; then
      trap::push "$new_trap" "$sig"
    else
      trap::push "$new_trap ; $(trap::get $sig)" "$sig"
    fi
  done
}

trap::append() {
  local new_trap="$1" && shift
  local sig
  for sig in $*; do
    if [[ -z "$(trap::get "$sig")" ]]; then
      trap::push "$new_trap" "$sig"
    else
      trap::push "$(trap::get $sig) ; $new_trap" "$sig"
    fi
  done
}