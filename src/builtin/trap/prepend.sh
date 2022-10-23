use common;
use push;

function trap::prepend() {
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