#!/bin/sh
lock() {
    #i3lock -c 222222
    #i3lock -i ~/.config/i3/lockscreen.png -t
    #i3lock -i /usr/share/backgrounds/* -t
    PICTURE=/tmp/i3lock.png
    SCREENSHOT="scrot $PICTURE"

    BLUR="5x4"

    $SCREENSHOT
    convert $PICTURE -blur $BLUR $PICTURE
    i3lock -i $PICTURE
    rm $PICTURE
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        #lock && systemctl supend
        systemctl supend
        ;;
    hibernate)
        #lock && systemctl hibernate
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
