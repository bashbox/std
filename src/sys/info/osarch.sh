function std::sys::info::cache_osarch {
    if test -v osarch; then {
        return;
    } fi

    if test $((0xFFFFFFFFFFFFFFFF)) -eq -1; then {
        : "64bit";
    } elif test $((0xFFFFFFFF)) -eq -1; then {
        : "32bit";
    } elif test $((0xFFFF)) -eq -1; then {
        : "16bit";
    } elif test $((0xFF)) -eq -1; then {
        : "8bit";
    } else {
        printf '%s\n' 'Failed to identify OS architecture' >&2;
        return 1;
    } fi

    osarch="$_";
}

function std::sys::info::osarch::is_64bit {
    std::sys::info::cache_osarch;
    test "$osarch" == "64bit";
}
function std::sys::info::osarch::is_32bit {
    std::sys::info::cache_osarch;
    test "$osarch" == "32bit";
}

function osarch::is_32bit {
    std::sys::info::osarch::is_32bit "$@";
}

function os_arch::is_64bit {
    std::sys::info::osarch::is_64bit "$@";
}