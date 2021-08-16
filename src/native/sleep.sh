bsleep() {
    read -rt "$1" <> <(:) || :;
}
