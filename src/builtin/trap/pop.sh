use common;

function trap::pop() {
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