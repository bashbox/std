use common;
use push;

function trap::append() {
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