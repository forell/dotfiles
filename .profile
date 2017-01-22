PATH=$PATH:/home/forell/bin/path
export MANPATH=/home/forell/.local/share/man:
export PAGER=/usr/bin/vimpager

if [ ! -s ~/.config/mpd/pid ]; then
    mpd &
fi

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx
fi
