PATH=$PATH:/home/forell/bin/path
export MANPATH=/home/forell/.local/share/man:
export LESS_TERMCAP_md=$'\e[01;38;5;124m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;31;37m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'

if [ ! -s ~/.config/mpd/pid ]; then
    mpd &
fi

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx
fi
