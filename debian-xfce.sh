#!/data/data/com.termux/files/usr/bin/bash

pkill -f "termux.x11" 2>/dev/null
sleep 1

export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 -ac &
sleep 2

am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity 2>/dev/null
sleep 3

proot-distro login debian --shared-tmp -- /bin/bash -c "
export DISPLAY=:0
startxfce4
"
