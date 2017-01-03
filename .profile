PATH=$PATH:/home/forell/bin/path
export MANPATH=/home/forell/.local/share/man:

# There's probably a neater way to do the following that I haven't looked into;
# all this does is swap esc and caps lock on my machine.
if [ -e "$HOME/.dotfiles/vc-swap-esc-caps.map" ]; then
    sudo loadkeys /home/forell/.dotfiles/vc-swap-esc-caps.map
fi

if [ ! -s ~/.config/mpd/pid ]; then
    mpd
fi

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx
fi
