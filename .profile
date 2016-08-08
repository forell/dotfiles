if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
PATH=$PATH:/home/forell/bin/path
# There's probably a neater way to do the following that I haven't looked into;
# all this does is swap esc and caps lock on my machine.
if [ -e "~/.dotfiles/vc-swap-esc-caps.map" ]; then
    sudo loadkeys ~/.dotfiles/vc-swap-esc-caps.map
fi
