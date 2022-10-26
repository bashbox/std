use common;

function std::sys::info::os::is_android {
    std::sys::info::cache_distro;
    [[ "${distro}" == "Android"* ]];
}

function std::sys::info::os::is_linux {
    std::sys::info::cache_os;
    test "${os:-}" == "Linux";
}

function std::sys::info::os::is_darwin {
    std::sys::info::cache_uname;
    [[ "${kernel_name:-}" == "Darwin"* ]];
}

function std::sys::info::os::is_windows {
    std::sys::info::cache_os;
    test "${os:-}" == "Windows";
}
