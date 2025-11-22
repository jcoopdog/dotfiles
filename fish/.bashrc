source ~/.profile

[ "$(tty)" = "/dev/tty1" ] && dbus-run-session niri

SHELL=/usr/bin/fish exec /usr/bin/fish
