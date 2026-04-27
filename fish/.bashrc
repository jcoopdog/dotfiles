source ~/.profile

[ "$(tty)" = "/dev/tty1" ] && dbus-run-session niri
[ "$(tty)" = "/dev/tty2" ] && htop

SHELL=/usr/bin/fish exec /usr/bin/fish
