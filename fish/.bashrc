source ~/.profile

[ "$(tty)" = "/dev/tty1" ] && dbus-run-session sway

SHELL=/usr/bin/fish exec /usr/bin/fish
