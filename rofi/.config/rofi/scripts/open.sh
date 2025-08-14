#!/bin/bash

echo -en "\0prompt\x1fv: \n"
echo -en "\0no-custom\x1ftrue\n"

if [ $ROFI_RETV -eq 1 ]; then
    coproc (kitty --hold nvim ~/$1)
    exit 0
else
    fd -u --base-directory ~
fi
