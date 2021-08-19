### From https://github.com/dylanaraps/pure-bash-bible
sleep() {
    read -rt "$1" <> <(:) || :;
}
