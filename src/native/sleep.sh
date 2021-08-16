### From https://github.com/dylanaraps/pure-bash-bible
bsleep() {
    read -rt "$1" <> <(:) || :;
}
