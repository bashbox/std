use box::print::log;
use box::native::sleep;

function process::preserve_sudo {
  if test "$EUID" -ne 0; then {
    if ! sudo -nv 2>/dev/null; then {
      log::warn "$___self_NAME needs root for some operations, reqesting root...";
      sudo -v;

      # Perserve the root access
      (
        while sleep 30 && { kill -0 "$___self_PID"; } 2>/dev/null; do {
          sudo -v;
        } done
      ) & disown;
    } fi
  } fi
}
