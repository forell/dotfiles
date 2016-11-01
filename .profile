if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH=$PATH:/home/forell/bin/path
export MANPATH=/home/forell/.local/share/man:

# There's probably a neater way to do the following that I haven't looked into;
# all this does is swap esc and caps lock on my machine.
if [ -e "$HOME/.dotfiles/vc-swap-esc-caps.map" ]; then
    sudo loadkeys /home/forell/.dotfiles/vc-swap-esc-caps.map
fi

if type "screen" > /dev/null && type "cmus" > /dev/null && ! cmus-remote -Q >/dev/null 2>&1; then
    screen -S cmus -dm cmus
fi

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx
fi
