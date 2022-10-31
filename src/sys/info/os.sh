use common;

function std::sys::info::os::is_android {
    std::sys::info::cache_distro;
    [[ "${distro}" == "Android"* ]];
}

alias 'os::is_android'=std::sys::info::os::is_android;

function std::sys::info::os::is_linux {
    std::sys::info::cache_os;
    test "${os:-}" == "Linux";
}

alias 'os::is_linux'=std::sys::info::os::is_linux;

function std::sys::info::os::is_darwin {
    std::sys::info::cache_uname;
    [[ "${kernel_name:-}" == "Darwin"* ]];
}

alias 'os::is_darwin'=std::sys::info::os::is_darwin;

function std::sys::info::os::is_windows {
    std::sys::info::cache_os;
    test "${os:-}" == "Windows";
}

alias 'os::is_windows'=std::sys::info::os::is_windows;
